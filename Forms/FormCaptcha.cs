using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace OOOGoodHome
{
    public partial class FormCaptcha : Form
    {
        public FormCaptcha()
        {
            InitializeComponent();
            //Captcha false in start
            HelperDB.captchaChecked = false;
            //!!!Connection to DB
            HelperDB.ConnectionDB = new Entity.ConnectionEntities();
            //Update Captcha
            HelperDB.updateCaptcha(labelCaptcha);
            textBoxCaptcha.Text = HelperDB.captchaText;
        }

        private void buttonEnter_Click(object sender, EventArgs e)
        {
            checkButton(((Button)sender).Tag + "");
        }

        private void textBoxCaptcha_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)13)
                checkButton("enter");
            else if (e.KeyChar == (char)27)
                checkButton("back");
        }

        private void checkButton(string tagOfButton)
        {
            switch (tagOfButton)
            {
                case "enter":
                    if (HelperDB.checkCaptcha(textBoxCaptcha))
                        this.Close();
                    else
                    {
                        HelperDB.thisUser = null;
                        MessageBox.Show("Текст не совпадает");
                    }
                    break;
                case "update":
                    HelperDB.updateCaptcha(labelCaptcha);
                    textBoxCaptcha.Text = HelperDB.captchaText;
                    break;
                case "back":
                    HelperDB.captchaChecked = false;
                    this.Close();
                    break;
            }
        }
    }
}
