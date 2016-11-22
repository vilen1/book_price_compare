package com.bookcompare.services;

import com.bookcompare.common.BzException;
import com.bookcompare.entities.ShopCode;
import org.junit.Test;

/**
 * Created by Raymond on 20/11/2016.
 */
public class BookInfoSpiderTest {

    @Test
    public void testAllOnlineShop() {
        try {

            String name = "咖啡机";

            for(ShopCode code : ShopCode.values()) {
                BookInfoSpiderBase spider = BookInfoSpiderBase.getSpider(code, name);
                System.out.println(spider.getBook());
            }

        } catch (BzException e) {
            e.printStackTrace();
        }
    }
}

