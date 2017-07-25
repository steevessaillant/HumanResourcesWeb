using System;
using HumanResourcesWeb.Tests.Steps;
using Microsoft.Practices.Unity;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Firefox;
using OpenQA.Selenium.IE;
using OpenQA.Selenium.Remote;

namespace HumanResourcesWeb.Tests
{
    public static class Bootstrapper
    {
        private static IUnityContainer _unityContainer;

        public static IUnityContainer Container => _unityContainer;

        public static void Initialize()
        {
            _unityContainer = new UnityContainer();

            Container.RegisterType<ChromeOptions>();
            Container.RegisterType<FirefoxOptions>();
            Container.RegisterType<InternetExplorerOptions>();

            var chromeOptions = Container.Resolve<ChromeOptions>();
            chromeOptions.AddArguments("--disable-extensions");

            var firefoxOptions = Container.Resolve<FirefoxOptions>();
           
            var ieOptions = Container.Resolve<InternetExplorerOptions>();

            var chromeLifetimeManager =  new ContainerControlledLifetimeManager();
            var firefoxLifetimeManager = new ContainerControlledLifetimeManager();
            var ieLifetimeManager = new ContainerControlledLifetimeManager();
            var remoteListetimeManager = new ContainerControlledLifetimeManager();


            Container.RegisterType<ChromeDriver>(chromeLifetimeManager,new InjectionConstructor(chromeOptions));
            Container.RegisterType<FirefoxDriver>(firefoxLifetimeManager,new InjectionConstructor(firefoxOptions));
            Container.RegisterType<InternetExplorerDriver>(ieLifetimeManager, new InjectionConstructor(ieOptions));
            DesiredCapabilities capabilities = DesiredCapabilities.Firefox();
            Container.RegisterType<RemoteWebDriver>(remoteListetimeManager, new InjectionConstructor(new Uri("http://mySeleniumHub:4444/wd/hub"), capabilities));


        }
    }
}
