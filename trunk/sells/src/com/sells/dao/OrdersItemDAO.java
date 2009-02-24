package com.sells.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * Data access object (DAO) for domain model class OrdersItem.
 * @see com.sells.dao.OrdersItem
 * @author MyEclipse - Hibernate Tools
 */
public class OrdersItemDAO extends HibernateDaoSupport {

    private static final Log log = LogFactory.getLog(OrdersItemDAO.class);

	//property constants
	public static final String ITEM_NO = "itemNo";
	public static final String ITEM_NM = "itemNm";
	public static final String ITEM_SPEC1 = "itemSpec1";
	public static final String ITEM_SPEC2 = "itemSpec2";
	public static final String QTY = "qty";
	public static final String PRICE = "price";

	protected void initDao() {
		//do nothing
	}
    
    public void save(OrdersItem transientInstance) {
        log.debug("saving OrdersItem instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(OrdersItem persistentInstance) {
        log.debug("deleting OrdersItem instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public OrdersItem findById( com.sells.dao.OrdersItemId id) {
        log.debug("getting OrdersItem instance with id: " + id);
        try {
            OrdersItem instance = (OrdersItem) getHibernateTemplate()
                    .get("com.sells.dao.OrdersItem", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(OrdersItem instance) {
        log.debug("finding OrdersItem instance by example");
        try {
            List results = getHibernateTemplate().findByExample(instance);
            log.debug("find by example successful, result size: " + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by example failed", re);
            throw re;
        }
    }    
    
    public List findByProperty(String propertyName, Object value) {
      log.debug("finding OrdersItem instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from OrdersItem as model where model." 
         						+ propertyName + "= ? order by model.id.seqno asc ";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByItemNo(Object itemNo) {
		return findByProperty(ITEM_NO, itemNo);
	}
	
	public List findByItemNm(Object itemNm) {
		return findByProperty(ITEM_NM, itemNm);
	}
	
	public List findByItemSpec1(Object itemSpec1) {
		return findByProperty(ITEM_SPEC1, itemSpec1);
	}
	
	public List findByItemSpec2(Object itemSpec2) {
		return findByProperty(ITEM_SPEC2, itemSpec2);
	}
	
	public List findByQty(Object qty) {
		return findByProperty(QTY, qty);
	}
	
	public List findByPrice(Object price) {
		return findByProperty(PRICE, price);
	}
	
    public OrdersItem merge(OrdersItem detachedInstance) {
        log.debug("merging OrdersItem instance");
        try {
            OrdersItem result = (OrdersItem) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(OrdersItem instance) {
        log.debug("attaching dirty OrdersItem instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(OrdersItem instance) {
        log.debug("attaching clean OrdersItem instance");
        try {
            getHibernateTemplate().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static OrdersItemDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (OrdersItemDAO) ctx.getBean("OrdersItemDAO");
	}
}