﻿#pragma checksum "..\..\..\pages\treeview.xaml" "{406ea660-64cf-4c82-b6f0-42d48172a799}" "B2F9896578BE25C165A8F06C801DF326"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;


namespace Menu_Rights.pages {
    
    
    /// <summary>
    /// treeview
    /// </summary>
    public partial class treeview : System.Windows.Controls.Page, System.Windows.Markup.IComponentConnector, System.Windows.Markup.IStyleConnector {
        
        
        #line 13 "..\..\..\pages\treeview.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.StackPanel stpTreeview;
        
        #line default
        #line hidden
        
        
        #line 14 "..\..\..\pages\treeview.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TreeView trvTreeview;
        
        #line default
        #line hidden
        
        
        #line 86 "..\..\..\pages\treeview.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox cmbGroups;
        
        #line default
        #line hidden
        
        
        #line 98 "..\..\..\pages\treeview.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnSaveTreeview;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/Menu_Rights;component/pages/treeview.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\pages\treeview.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.stpTreeview = ((System.Windows.Controls.StackPanel)(target));
            
            #line 13 "..\..\..\pages\treeview.xaml"
            this.stpTreeview.Loaded += new System.Windows.RoutedEventHandler(this.init);
            
            #line default
            #line hidden
            return;
            case 2:
            this.trvTreeview = ((System.Windows.Controls.TreeView)(target));
            return;
            case 8:
            this.cmbGroups = ((System.Windows.Controls.ComboBox)(target));
            
            #line 88 "..\..\..\pages\treeview.xaml"
            this.cmbGroups.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.groupSelectionChangedHandler);
            
            #line default
            #line hidden
            return;
            case 9:
            this.btnSaveTreeview = ((System.Windows.Controls.Button)(target));
            
            #line 98 "..\..\..\pages\treeview.xaml"
            this.btnSaveTreeview.Click += new System.Windows.RoutedEventHandler(this.btnSaveTreeview_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        void System.Windows.Markup.IStyleConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 3:
            
            #line 19 "..\..\..\pages\treeview.xaml"
            ((System.Windows.Controls.CheckBox)(target)).Checked += new System.Windows.RoutedEventHandler(this.visibilityChangedHandler);
            
            #line default
            #line hidden
            
            #line 20 "..\..\..\pages\treeview.xaml"
            ((System.Windows.Controls.CheckBox)(target)).Unchecked += new System.Windows.RoutedEventHandler(this.visibilityChangedHandler);
            
            #line default
            #line hidden
            break;
            case 4:
            
            #line 28 "..\..\..\pages\treeview.xaml"
            ((System.Windows.Controls.CheckBox)(target)).Checked += new System.Windows.RoutedEventHandler(this.visibilityChangedHandler);
            
            #line default
            #line hidden
            
            #line 29 "..\..\..\pages\treeview.xaml"
            ((System.Windows.Controls.CheckBox)(target)).Unchecked += new System.Windows.RoutedEventHandler(this.visibilityChangedHandler);
            
            #line default
            #line hidden
            break;
            case 5:
            
            #line 32 "..\..\..\pages\treeview.xaml"
            ((System.Windows.Controls.CheckBox)(target)).Checked += new System.Windows.RoutedEventHandler(this.visibilityChangedHandler);
            
            #line default
            #line hidden
            
            #line 33 "..\..\..\pages\treeview.xaml"
            ((System.Windows.Controls.CheckBox)(target)).Unchecked += new System.Windows.RoutedEventHandler(this.visibilityChangedHandler);
            
            #line default
            #line hidden
            break;
            case 6:
            
            #line 36 "..\..\..\pages\treeview.xaml"
            ((System.Windows.Controls.CheckBox)(target)).Checked += new System.Windows.RoutedEventHandler(this.visibilityChangedHandler);
            
            #line default
            #line hidden
            
            #line 37 "..\..\..\pages\treeview.xaml"
            ((System.Windows.Controls.CheckBox)(target)).Unchecked += new System.Windows.RoutedEventHandler(this.visibilityChangedHandler);
            
            #line default
            #line hidden
            break;
            case 7:
            
            #line 40 "..\..\..\pages\treeview.xaml"
            ((System.Windows.Controls.CheckBox)(target)).Checked += new System.Windows.RoutedEventHandler(this.visibilityChangedHandler);
            
            #line default
            #line hidden
            
            #line 41 "..\..\..\pages\treeview.xaml"
            ((System.Windows.Controls.CheckBox)(target)).Unchecked += new System.Windows.RoutedEventHandler(this.visibilityChangedHandler);
            
            #line default
            #line hidden
            break;
            }
        }
    }
}

