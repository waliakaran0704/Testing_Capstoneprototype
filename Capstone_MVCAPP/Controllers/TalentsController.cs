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
    public class TalentsController : Controller
    {
        private Capstone_DBModelContainer db = new Capstone_DBModelContainer();

        // GET: Talents
        public ActionResult Index()
        {
            var talents = db.Talents.Include(t => t.Admin).Include(t => t.EthinicOrigin).Include(t => t.Login);
            return View(talents.ToList());
        }

        // GET: Talents/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Talent talent = db.Talents.Find(id);
            if (talent == null)
            {
                return HttpNotFound();
            }
            return View(talent);
        }

        // GET: Talents/Create
        public ActionResult Create()
        {
            ViewBag.AdminPKAmin_ID = new SelectList(db.Admins, "PKAmin_ID", "PKAmin_ID");
            ViewBag.EthinicOriginPK_EO_ID = new SelectList(db.EthinicOrigins, "PK_EO_ID", "EthinicName");
            ViewBag.LoginLogin_ID = new SelectList(db.Logins, "Login_ID", "UserName");
            return View();
        }

        // POST: Talents/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PKTalent_ID,FirstName,LastName,Email,HomePhoneNum,CellPhoneNum,BirthDate,Gender,Weight,Height,EyeColor,HairColor,UnionStatus,SIN,AdminPKAmin_ID,EthinicOriginPK_EO_ID,LoginLogin_ID,NumOfRequest,NumOfHired")] Talent talent)
        {
            if (ModelState.IsValid)
            {
                db.Talents.Add(talent);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.AdminPKAmin_ID = new SelectList(db.Admins, "PKAmin_ID", "PKAmin_ID", talent.AdminPKAmin_ID);
            ViewBag.EthinicOriginPK_EO_ID = new SelectList(db.EthinicOrigins, "PK_EO_ID", "EthinicName", talent.EthinicOriginPK_EO_ID);
            ViewBag.LoginLogin_ID = new SelectList(db.Logins, "Login_ID", "UserName", talent.LoginLogin_ID);
            return View(talent);
        }

        // GET: Talents/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Talent talent = db.Talents.Find(id);
            if (talent == null)
            {
                return HttpNotFound();
            }
            ViewBag.AdminPKAmin_ID = new SelectList(db.Admins, "PKAmin_ID", "PKAmin_ID", talent.AdminPKAmin_ID);
            ViewBag.EthinicOriginPK_EO_ID = new SelectList(db.EthinicOrigins, "PK_EO_ID", "EthinicName", talent.EthinicOriginPK_EO_ID);
            ViewBag.LoginLogin_ID = new SelectList(db.Logins, "Login_ID", "UserName", talent.LoginLogin_ID);
            return View(talent);
        }

        // POST: Talents/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PKTalent_ID,FirstName,LastName,Email,HomePhoneNum,CellPhoneNum,BirthDate,Gender,Weight,Height,EyeColor,HairColor,UnionStatus,SIN,AdminPKAmin_ID,EthinicOriginPK_EO_ID,LoginLogin_ID,NumOfRequest,NumOfHired")] Talent talent)
        {
            if (ModelState.IsValid)
            {
                db.Entry(talent).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.AdminPKAmin_ID = new SelectList(db.Admins, "PKAmin_ID", "PKAmin_ID", talent.AdminPKAmin_ID);
            ViewBag.EthinicOriginPK_EO_ID = new SelectList(db.EthinicOrigins, "PK_EO_ID", "EthinicName", talent.EthinicOriginPK_EO_ID);
            ViewBag.LoginLogin_ID = new SelectList(db.Logins, "Login_ID", "UserName", talent.LoginLogin_ID);
            return View(talent);
        }

        // GET: Talents/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Talent talent = db.Talents.Find(id);
            if (talent == null)
            {
                return HttpNotFound();
            }
            return View(talent);
        }

        // POST: Talents/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Talent talent = db.Talents.Find(id);
            db.Talents.Remove(talent);
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
