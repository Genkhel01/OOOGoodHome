using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace OOOGoodHome.Forms
{
    public partial class FormLogin : Form
    {
        public FormLogin()
        {
            InitializeComponent();
        }
        public void buttonAuthorisation_Click(object sender, EventArgs e)
        {
            checkButton(((Button)sender).Tag + "");
        }

        public void checkButton(string tagOfButton)
        {
            switch (tagOfButton)
            {
                case "guest":
                    HelperDB.thisUser = HelperDB.ConnectionDB.Users.Where(x => x.UserLogin == "Guest".ToString() && x.UserPassword == "1111".ToString()).FirstOrDefault();
                    HelperDB.captchaChecked = true;
                    break;
                case "auto":
                    HelperDB.thisUser = HelperDB.ConnectionDB.Users.Where(x => x.UserLogin == textBoxLogin.Text && x.UserPassword == textBoxPassword.Text).FirstOrDefault();
                    if (HelperDB.thisUser != null)
                    {
                        new OOOGoodHome.FormCaptcha().ShowDialog();
                    }
                    else
                        MessageBox.Show("Пользователь не найден");
                    break;
                case "back":
                    this.Close();
                    break;
            }

            if (textBoxLogin.Text == "")
                MessageBox.Show("Поле логин не может быть пустым");
            else if (textBoxPassword.Text == "")
                MessageBox.Show("Поле пароль не может быть пустым");

            if (HelperDB.captchaChecked)
            {
                if (HelperDB.thisUser != null && HelperDB.thisUser.UserLogin != "Guest")
                {
                    MessageBox.Show("Вы вошли как " + HelperDB.thisUser.UserName + " " + HelperDB.thisUser.UserSurname
                        + " " + HelperDB.thisUser.Role.Name, "Проверка пройдена!");
                    new OOOGoodHome.FromCatalog0().ShowDialog();
                    this.Close();
                }
                else
                {
                    MessageBox.Show("Вы вошли как " + "Гость ", "Проверка пройдена!");
                    new OOOGoodHome.FromCatalog0().ShowDialog();
                    this.Close();
                }
            }

        }
    }
}
