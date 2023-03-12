using Microsoft.VisualStudio.TestTools.UnitTesting;
using OOOGoodHome;
using System;
using System.Linq;
using System.Windows.Forms;
using System.Reflection.Emit;
using OOOGoodHome.Forms;

namespace UnitTestOOOGoodHome
{
    [TestClass]
    public class UnitTestsCheckCaptchaText
    {
        [TestMethod]
        public void TestPositiveCheckCaptchaText()
        {
            HelperDB.captchaText = "a";
            String testText = "a";

            //Сравнение тестового текста и капчи
            Assert.IsTrue(HelperDB.checkCaptchaText(testText));
        }

        [TestMethod]
        public void TestNegativeCheckCaptchaText()
        {
            HelperDB.captchaText = "a";
            String testText = "b";

            //Сравнение тестового текста и капчи
            Assert.IsFalse(HelperDB.checkCaptchaText(testText));
        }

        [TestMethod]
        public void TestEmptyStringCheckCaptchaText()
        {
            HelperDB.captchaText = String.Empty;
            String testText = String.Empty;

            //Сравнение тестового текста и капчи
            Assert.IsTrue(HelperDB.checkCaptchaText(testText));
        }
    }

    [TestClass]
    public class UnitTestsUpdateCaptchaText
    {
        [TestMethod]
        public void TestAvailableLenghtUpdateCaptchaText()
        {
            HelperDB.updateCaptchaText(String.Empty);

            //Создать новую капчу и проверить её длинну
            Assert.IsTrue(HelperDB.captchaText.Length == HelperDB.lenghtOfCaptcha);
        }

        [TestMethod]
        public void TestUnavailableLenghtUpdateCaptchaText()
        {
            String testUpdateText = "123456";

            //Создать новую капчу и проверить её длинну
            Assert.IsFalse(testUpdateText.Length == HelperDB.lenghtOfCaptcha);
        }
    }
}