using CoffeeShop.DAO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CoffeeShop
{
    public partial class fLogin : Form
    {
        public fLogin()
        {
            InitializeComponent();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;
            if (Login(username, password))
            {
                fHome fHome = new fHome();
                this.Hide();
                fHome.ShowDialog();
                this.Show();
            }
            else
            {
                MessageBox.Show("Account or Password is not correct!", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        bool Login(string username, string password)
        {
            return AccountDAO.Instance.Login(username, password);
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void fLogin_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (MessageBox.Show("Would you like to exit this program?", "INFOMATION", MessageBoxButtons.OKCancel, MessageBoxIcon.Information) == System.Windows.Forms.DialogResult.Cancel)
            {
                e.Cancel = true;
            }
        }
    }
}
