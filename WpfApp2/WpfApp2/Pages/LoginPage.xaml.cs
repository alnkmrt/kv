using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace WpfApp2.Pages
{
    /// <summary>
    /// Логика взаимодействия для LoginPage.xaml
    /// </summary>
    public partial class LoginPage : Page
    {
        public LoginPage()
        {
            InitializeComponent();
        }

        private void LoginB_Click(object sender, RoutedEventArgs e)
        {
            if (LoginTB.Text == "1" && PasswordPB.Password == "1") NavigationService.Navigate(new Pages.ClientPage());
            else if (LoginTB.Text == "2" && PasswordPB.Password == "2") NavigationService.Navigate(new Pages.ManagerPage());
            else if (LoginTB.Text == "3" && PasswordPB.Password == "3") NavigationService.Navigate(new Pages.BrokerPage());
            else MessageBox.Show("Введите корректные данные");
        }
    }
}
