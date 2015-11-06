using System;
using System.Collections.Generic;
using System.Text;

namespace Menu_Rights_BO_DAO.BO
{
    public class appSettings 
    {
        // BACKING FIELDS
        string _topTreeviewItemColor;
        string _parentTreeviewItemColor;

        int _topTreeviewItemFontSize;
        int _parentTreeviewItemFontSize;

        // PROPERTIES
        public string topTreeviewItemColor { 
            get { return _topTreeviewItemColor; } 
            set { _topTreeviewItemColor = value; } 
        }

        public string parentTreeviewItemColor { 
            get { return _parentTreeviewItemColor; } 
            set { _parentTreeviewItemColor = value; } 
        }

        public int topTreeviewItemFontSize { 
            get { return _topTreeviewItemFontSize; } 
            set { _topTreeviewItemFontSize = value; } 
        }
        
        public int parentTreeviewItemFontSize { 
            get { return _parentTreeviewItemFontSize; } 
            set { _parentTreeviewItemFontSize = value; } 
        }
    }
}
