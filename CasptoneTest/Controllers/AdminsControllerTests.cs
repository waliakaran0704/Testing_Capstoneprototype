using Microsoft.VisualStudio.TestTools.UnitTesting;
using web_mvc.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using web_mvc.Controllers;
using System.Web.Mvc;

namespace web_mvc.Controllers.Tests
{
    [TestClass()]
    public class AdminsControllerTests
    {
        [TestMethod()]
        public void IndexMethodTest()
        {
            // Arrange
            AdminsController controller = new AdminsController();
            String expected = "Index";
            // Act
            ViewResult result = controller.Index() as ViewResult;

            String actual = result.ViewName;
            // Assert
            Assert.AreEqual(expected, actual);
        }
    }
}