using OOOGoodHome.Entity;
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
    public partial class FromCatalog0 : Form
    {
        public FromCatalog0()
        {
            InitializeComponent();
            List<Product> products = HelperDB.ConnectionDB.Products.ToList<Product>();
            dataGridViewCatalog.Rows.Clear();
            //dataGridViewCatalog.Columns.Clear();
            dataGridViewCatalog.AutoGenerateColumns = true;
            //dataGridViewCatalog.DataSource = products;
            int rowNum = 0;
            foreach (Product product in products)
            {
                dataGridViewCatalog.Rows.Add();
                dataGridViewCatalog.Rows[rowNum].Cells[0].Value = products[rowNum].Image;
                dataGridViewCatalog.Rows[rowNum].Cells[1].Value = products[rowNum].Name;
                dataGridViewCatalog.Rows[rowNum].Cells[2].Value = products[rowNum].PriceWithDiscount;
                dataGridViewCatalog.Rows[rowNum].Cells[3].Value = products[rowNum].Category.Name;
                dataGridViewCatalog.Rows[rowNum].Cells[4].Value = products[rowNum].Manufacture.Name;
                dataGridViewCatalog.Rows[rowNum].Cells[5].Value = products[rowNum].Supplier.Name;
                dataGridViewCatalog.Rows[rowNum].Cells[6].Value = products[rowNum].CountInStorage;
                rowNum++;
            }
        }

        private void buttonExit_Click(object sender, EventArgs e)
        {
            checkButton(((Button)sender).Tag + "");
        }

        public void checkButton(string tagOfButton)
        {
            switch (tagOfButton)
            {
                case "guest":

                    break;
                case "auto":

                case "back":
                    this.Close();
                    break;
            }
        }
    }
}
