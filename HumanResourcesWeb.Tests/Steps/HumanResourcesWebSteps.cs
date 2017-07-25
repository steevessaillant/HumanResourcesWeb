using TechTalk.SpecFlow;
using NUnit.Framework;
using OpenQA.Selenium;
using OpenQA.Selenium.IE;
using OpenQA.Selenium.Support.Extensions;
using System;
using OpenQA.Selenium.Remote;
using System.Data.Common;
using System.Data.SqlClient;
using System.Configuration;
using System.Diagnostics;
using OpenQA.Selenium.Support.UI;
using static Microsoft.Practices.Unity.UnityContainerExtensions;
using System.Linq;

namespace HumanResourcesWeb.Tests.Steps
{
    [Binding]
    public class HumanResourcesWebSteps
    {

        private IWebDriver webDriver;
        private DbConnection connection;
        private string webServerBaseAdress = "your_lan_ip:7777"; // "IP:Port" cannot be localhost here
        public HumanResourcesWebSteps()
        {
            Bootstrap(true);

            InitializeDatabaseConnection();
        }

        private void Bootstrap(bool seleniumRemoteHubMode = false)
        {
            Bootstrapper.Initialize();

            if (seleniumRemoteHubMode)
            {
                webDriver = Bootstrapper.Container.Resolve<RemoteWebDriver>();
            }
            else
            {
                webDriver = Bootstrapper.Container.Resolve<InternetExplorerDriver>();
            }
        }

        private void InitializeDatabaseConnection()
        {
            connection = new SqlConnection
                (ConfigurationManager
                .ConnectionStrings["DefaultConnection"]
                .ConnectionString);
        }

        [AfterScenario]
        public void AfterScenario()
        {
            webDriver.Quit();
            webDriver.Dispose();
        }

        [BeforeScenario]
        public void BeforeScenario()
        {
            try
            {
                if (connection != null && connection.State != System.Data.ConnectionState.Open)
                    connection.Open();

                var command = connection.CreateCommand();
                command.CommandText = "DELETE FROM dbo.AspNetUsers";
                command.ExecuteNonQuery();
                connection.Close();
            }
            catch (SqlException ex)
            {
                Debug.Print(ex.Message);
            }
        }

        /// <summary>
        /// Background section of gherkin file
        /// </summary>
        [Given(@"that we have no user created in our application")]
        public void GivenThatWeHaveNoUserCreatedInOurApplication()
        {
            //delete all users from data-store
        }

        [Given(@"I navigate to the Registration page")]
        public void GivenINavigateToTheRegistrationPage()
        {
            Console.WriteLine("Navigating...");
            //selenium devrait ouvrir le lien 
            webDriver.Url = @"http://" + webServerBaseAdress + "/Account/Register";
            webDriver.Navigate();
        }

        [When(@"I execute the register command with a bad password")]
        public void WhenIExecuteTheRegisterCommandWithABadPassword()
        {
            //et saisir les donnees
            FillEmailAndHometownFields();
            FillBothPasswordFields("Abcdef12", "Abcdef12");
            DoWebpageSubmit();

        }

        private void DoWebpageSubmit(int? waitSeconds = null)
        {
        
            var submitButton = webDriver.FindElement(By.CssSelector(@"input[value=Register]"));
            submitButton.Click();

            if (waitSeconds.HasValue)
            {
                IWait<IWebDriver> wait = new WebDriverWait(webDriver, TimeSpan.FromSeconds(5));
                wait.Until(x => ((IJavaScriptExecutor)webDriver).ExecuteScript("return document.readyState").Equals("complete"));
            }
            
        }

        private void FillEmailAndHometownFields()
        {
            var emailElement = webDriver.FindElement(By.Name("Email"));
            emailElement.SendKeys("steevessaillant@gmail.com");

            var hometownElement = webDriver.FindElement(By.Name("Hometown"));
            hometownElement.SendKeys("Paris");
        }

        private void FillBothPasswordFields(string password, string confirmPassword)
        {
            var passwordElement = webDriver.FindElement(By.Name("Password"));
            passwordElement.SendKeys(password == null ? string.Empty : password);


            var confirmPasswordElement = webDriver.FindElement(By.Name("ConfirmPassword"));
            confirmPasswordElement.SendKeys(confirmPassword == null ? string.Empty : confirmPassword);
        }

        [Then(@"The message ""(.*)"" should be displayed")]
        public void ThenTheMessageShouldBeDisplayed(string errorMessage)
        {
            Assert.IsTrue(webDriver.PageSource.Contains(errorMessage));
        }

        private void TakeScreenshot()
        {
            var screenshot = webDriver.TakeScreenshot();
            screenshot.SaveAsFile(@"d:\BadPassword.png", ScreenshotImageFormat.Png);
        }

        [When(@"I execute the register command with a missing confirm password")]
        public void WhenIExecuteTheRegisterCommandWithAMissingConfirmPassword()
        {
            FillEmailAndHometownFields();
            FillBothPasswordFields("Abcdef12", null);
            DoWebpageSubmit();
        }

        [When(@"I execute the register command with a missing password but providing a confirm password")]
        public void WhenIExecuteTheRegisterCommandWithAMissingPasswordButProvidingAConfirmPassword()
        {
            FillEmailAndHometownFields();
            FillBothPasswordFields(null, "Abcdef12");
            DoWebpageSubmit();
        }


        [When(@"I execute the register command with good data")]
        public void WhenIExecuteTheRegisterCommandWithGoodData()
        {

            FillEmailAndHometownFields();
            FillBothPasswordFields("Wcdfgrt_123", "Wcdfgrt_123");

            DoWebpageSubmit(5);
        }

        [Then(@"The browser url last segment should be ""(.*)""")]
        public void ThenTheBrowserUrlLastSegmentShouldBe(string url)
        {
            var actualUrl = webDriver.Url;
            var lastSegment = actualUrl.Split('/').ToList().Last();
            Assert.True(webDriver.Url.Contains(lastSegment));
        }





    }
}
