using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace OOOGoodHome
{
    public class HelperDB
    {
        //!!!CAPTCHA!!!

        public static bool captchaChecked = false;
        public static string captchaText = "";
        public static int lenghtOfCaptcha = 5;

        public static bool checkCaptcha(TextBox textBox)
        {
            return captchaChecked = checkCaptchaText(textBox.Text);
        }

        public static bool checkCaptchaText(String text)
        {
            return text == captchaText;
        }

        public static void updateCaptcha(Label label)
        {
            label.Text = updateCaptchaText(label.Text);
        }

        public static String updateCaptchaText(String textForCaptcha)
        {
            try
            {
                string newCaptcha = "";
                string availableSymbolString = "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm1234567890";
                char[] avaliableSymbolChars = availableSymbolString.ToCharArray();

                Random random = new Random();
                for (int i = 0; i < lenghtOfCaptcha; i++)
                    newCaptcha += avaliableSymbolChars[random.Next(avaliableSymbolChars.Length)];

                captchaText = newCaptcha;
            }
            catch { }
            return textForCaptcha;
        }


        //!!!DB!!!

        public static Entity.ConnectionEntities ConnectionDB;
        public static Entity.User thisUser;

    }
}
