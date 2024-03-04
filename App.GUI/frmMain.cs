using System;
using System.Drawing;
using System.Windows.Forms;

namespace App.GUI
{
    public partial class frmMain : Form
    {
        private const string DefaultLogin = "Tài khoản";
        private const string DefaultPwd = "XXXXXX";


        public frmMain()
        {
            InitializeComponent();
        }

        private void frmLogin_Load(object sender, EventArgs e)
        {
            txtUsername.Select();
            txtUsername.Text = DefaultLogin;
            txtUsername.ForeColor = Color.FromArgb(115, 115, 115);
            txtPassword.Text = "XXXXXX";
            txtPassword.ForeColor = Color.FromArgb(115, 115, 115);
        }


        private void txtUsername_Enter(object sender, EventArgs e)
        {
            // Xóa chữ mặc định khi TextBox nhận focus.
            if (txtUsername.Text == DefaultLogin)
            {
                txtUsername.Text = string.Empty;
                txtUsername.ForeColor = Color.Black;
            }
        }

        private void txtPassword_Enter(object sender, EventArgs e)
        {
            if (txtPassword.Text == DefaultPwd)
            {
                txtPassword.Text = string.Empty;
                txtPassword.ForeColor = Color.Black;
            }
        }

        private void txtUsername_Leave(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtUsername.Text))
            {
                txtUsername.Text = DefaultLogin;
            }
        }

        private void btnReset_Click(object sender, EventArgs e)
        {
            if (txtUsername.Text != DefaultLogin || txtPassword.Text != DefaultPwd)
            {
                txtUsername.Text = DefaultLogin;
                txtUsername.ForeColor = Color.FromArgb(115, 115, 115);
                txtPassword.Text = DefaultPwd;
                txtPassword.ForeColor = Color.FromArgb(115, 115, 115);
            }
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {

        }

        private void btnRegister_Click(object sender, EventArgs e)
        {
            frmRegister frmRegister = new frmRegister();
            frmRegister.ShowDialog();
        }
    }
}
