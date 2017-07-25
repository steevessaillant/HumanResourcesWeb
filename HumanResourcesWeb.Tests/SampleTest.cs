using System;
using System.Collections.Generic;
using NUnit.Framework;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using Enigmatry.Selenium.Tools.Attributes;

namespace Enigmatry.Selenium.Tools
{
    /* Test case should be derived from base fixture class SeleniumTestBase;
     * App.config contains adjustable browser/platform configurations for testing (supportedBrowsers section);
     * Derived tests will be run sequentially on all defined browsers;
     * Use property ignore='true' to skip specified configuration;
     */
    [TestFixture("browser1")]
    [TestFixture("browser2")]
    [TestFixture("browser3")]
    [TestFixture("browser4")]
    [TestFixture("browser5")]
    [TestFixture("browser6")]
    [TestFixture("browser7")]
    [TestFixture("browser8")]
    [TestFixture("browser9")]
    [TestFixture("browser10")]
    [TestFixture("browser11")]
    [TestFixture("browser12")]
    [TestFixture("browser13")]
    [TestFixture("browser14")]
    [TestFixture("browser15")]
    public class SampleTest : SeleniumTestBase
    {
        public SampleTest(string config)
            : base(config)
        {
        }

        [Test, IgnoreConfig("browser3,browser4")]
        public void EnigmatryTest()
        {
            const string searchQuery = "enigmatry";
            WebDriver.Navigate().GoToUrl("http://google.nl");

            var element = WebDriver.FindElement(By.Name("q"));
            element.SendKeys(searchQuery);
            element.Submit();

            var wait = new WebDriverWait(WebDriver, TimeSpan.FromSeconds(10));
            Assert.That(wait.Until(webDriver => webDriver.Title.ToLowerInvariant().StartsWith(searchQuery)));
        }
    }
}
