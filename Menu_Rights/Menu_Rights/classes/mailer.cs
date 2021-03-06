﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using System.Net.Mail;
using Menu_Rights_BO_DAO.BO;
using Menu_Rights_BO_DAO.DAO;

namespace Menu_Rights.classes {

	static class mailer {

		internal static void sendMail(string messageBody, Menu_Rights_BO_DAO.BO.userGroup group) {
			List<appUser> usersInGroup = dbUsers.getAllUsersForGroup(group.id);

			foreach (appUser user in usersInGroup) {
				MailAddress fromAddress = new MailAddress("wpfmenurights@gmail.com", "WPF application");
				MailAddress toAddress = new MailAddress(user.email, user.login);
				const string fromPassword = "wpf menu";
				const string subject = "Uw rechten zijn aangepast.";

				SmtpClient smtp = new SmtpClient {
					Host = "smtp.gmail.com",
					Port = 587,
					EnableSsl = true,
					DeliveryMethod = SmtpDeliveryMethod.Network,
					UseDefaultCredentials = false,
					Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
				};

				using (MailMessage message = new MailMessage(fromAddress, toAddress) {
					Subject = subject,
					Body = messageBody
				}) {
					smtp.Send(message);
				}
			}
		}

	}
}

