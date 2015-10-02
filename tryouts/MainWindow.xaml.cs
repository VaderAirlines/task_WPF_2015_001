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

namespace WpfApplication1 {
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window {
        public MainWindow() {
            InitializeComponent();
        }

        private void generateComponents(object sender, RoutedEventArgs e) {
            var bob = new Person { Name = "Bob", Age = 34, Checked = false };
            var sally = new Person { Name = "Sally", Age = 28, Checked = true };
            sally.Subordinates.Add(new Person { Name = "Joe", Age = 15, Checked = true });

            _treeView.Items.Add(bob);
            _treeView.Items.Add(sally);
        }
    }

    public class Person {
        public Person() {
            Subordinates = new List<Person>();
        }

        public string Name { get; set; }
        public int Age { get; set; }
        public bool Checked { get; set; }
        public string TooltipText { get { return "test"; } }
        public List<Person> Subordinates { get; private set; }
    }
}