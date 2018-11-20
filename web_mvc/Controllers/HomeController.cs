using dbmodel11;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace web_mvc.Controllers
{
    public class HomeController : Controller
    {
        private CapstoneMVCAPPDBEntities db = new CapstoneMVCAPPDBEntities();
        public ActionResult Login()
        {
            return View();
        }

       // [HttpPost]
      //  [ValidateAntiForgeryToken]
        public ActionResult Login(Login log)
        {
            if (ModelState.IsValid)
            {
                var login = from l in db.Logins
                            where l.UserName == log.UserName && l.Password == log.Password
                            select l;

                if (login.FirstOrDefault() != null)
                {
                    foreach (Login item in login)
                    {
                        var queryForTalent = from l in db.Talents
                                             where l.LoginLogin_ID == item.Login_ID
                                             select l;
                        if (queryForTalent.FirstOrDefault() != null)
                        {
                            foreach (Talent talent in queryForTalent)
                            {
                                TempData["Talent"] = talent;
                            }
                            return RedirectToAction("WelcomeTalent");
                        }

                        var queryForAdmin = from l in db.Admins
                                            where l.LoginLogin_ID == item.Login_ID
                                            select l;
                        if (queryForAdmin.FirstOrDefault() != null)
                        {
                            foreach (Admin admin in queryForAdmin)
                            {
                                TempData["Admin"] = admin;
                            }
                            return RedirectToAction("WelcomeAdmin");
                        }
                    }
                    //    //return Redirect("http://localhost:51782/talents");
                };
            }
            return View(log);
        }
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult WelcomeTalent()
        {
            return View(TempData["Talent"]);
        }

        public ActionResult WelcomeAdmin()
        {
            return View(TempData["Admin"]);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}