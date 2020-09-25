package com.jeep.domain;


import java.util.Iterator;
import java.util.List;

public class ParentAndChild {
    public static List<Menu> getSort(List<Menu> list) {
        for (int i = 0; i < list.size(); i++) {
            Iterator<Menu> iterator = list.iterator();
            int index = 0;
            while (iterator.hasNext()) {
                Menu menu = iterator.next();
                if (list.get(i).getId() == menu.getSm_parent_id()) {
                    list.get(i).getChildren().add(menu);
                    iterator.remove();
                    if (index < i) {
                        i--;
                    }
                }
                index++;
            }
        }
        return list;
    }

}
