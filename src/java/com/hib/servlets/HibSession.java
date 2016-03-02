/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hib.servlets;

import com.hib.mappings.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Sampath Dhananjaya
 */
public class HibSession {
    
    public Session session;
    public Transaction transaction;
    
    public HibSession(){
        session=HibernateUtil.getSessionFactory().openSession();
        transaction=session.beginTransaction();
    }
}

