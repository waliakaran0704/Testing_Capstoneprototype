using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using _01___CP_DBModel;

namespace Capstone_MVCAPP.Controllers
{
    public class CastingDirectorsController : Controller
    {
        private Capstone_DBModelContainer db = new Capstone_DBModelContainer();

        // GET: CastingDirectors
        public ActionResult Index()
        {
            var castingDirectors = db.CastingDirectors.Include(c => c.Admin).Include(c => c.Login);
            return View(castingDirectors.ToList());
        }

        // GET: CastingDirectors/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CastingDirector castingDirector = db.CastingDirectors.Find(id);
            if (castingDirector == null)
            {
                return HttpNotFound();
            }
            return View(castingDirector);
        }

        // GET: CastingDirectors/Create
        public ActionResult Create()
        {
            ViewBag.AdminPKAmin_ID = new SelectList(db.Admins, "PKAmin_ID", "PKAmin_ID");
            ViewBag.LoginLogin_ID = new SelectList(db.Logins, "Login_ID", "UserName");
            return View();
        }

        // POST: CastingDirectors/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PKCD_ID,AdminPKAmin_ID,LoginLogin_ID")] CastingDirector castingDirector)
        {
            if (ModelState.IsValid)
            {
                db.CastingDirectors.Add(castingDirector);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.AdminPKAmin_ID = new SelectList(db.Admins, "PKAmin_ID", "PKAmin_ID", castingDirector.AdminPKAmin_ID);
            ViewBag.LoginLogin_ID = new SelectList(db.Logins, "Login_ID", "UserName", castingDirector.LoginLogin_ID);
            return View(castingDirector);
        }

        // GET: CastingDirectors/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CastingDirector castingDirector = db.CastingDirectors.Find(id);
            if (castingDirector == null)
            {
                return HttpNotFound();
            }
            ViewBag.AdminPKAmin_ID = new SelectList(db.Admins, "PKAmin_ID", "PKAmin_ID", castingDirector.AdminPKAmin_ID);
            ViewBag.LoginLogin_ID = new SelectList(db.Logins, "Login_ID", "UserName", castingDirector.LoginLogin_ID);
            return View(castingDirector);
        }

        // POST: CastingDirectors/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PKCD_ID,AdminPKAmin_ID,LoginLogin_ID")] CastingDirector castingDirector)
        {
            if (ModelState.IsValid)
            {
                db.Entry(castingDirector).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.AdminPKAmin_ID = new SelectList(db.Admins, "PKAmin_ID", "PKAmin_ID", castingDirector.AdminPKAmin_ID);
            ViewBag.LoginLogin_ID = new SelectList(db.Logins, "Login_ID", "UserName", castingDirector.LoginLogin_ID);
            return View(castingDirector);
        }

        // GET: CastingDirectors/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CastingDirector castingDirector = db.CastingDirectors.Find(id);
            if (castingDirector == null)
            {
                return HttpNotFound();
            }
            return View(castingDirector);
        }

        // POST: CastingDirectors/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CastingDirector castingDirector = db.CastingDirectors.Find(id);
            db.CastingDirectors.Remove(castingDirector);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
