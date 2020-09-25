import java.util.*;

public class Tr {
    public Tr() {
    }



    public static void main(String[] args) {
       Map<Integer,String> map = new HashMap<>();
       int a= 5;
       map.put(1,"aaa");
       map.put(2,"bbb");
       map.put(3,"ccc");
       map.put(4,"eee");


      char[] ab =b.toCharArray();




//        Set<Map.Entry<Integer, String>> entries = map.entrySet();
//        Set<Integer> integers = map.keySet();
//        Iterator<Integer> iterator = integers.iterator();
//        while (iterator.hasNext()){
//            Integer next = iterator.next();
//            System.out.println(next+":"+map.get(next));
//        }

//        Set<Map.Entry<Integer, String>> entries = map.entrySet();
//        Iterator<Map.Entry<Integer, String>> iterator = entries.iterator();
//        while (iterator.hasNext()){
//            Map.Entry<Integer, String> next = iterator.next();
//            Integer key = next.getKey();
//            String value = next.getValue();
//            System.out.println(key+"->"+value);
//        }

        Collection<String> values = map.values();
        Iterator<String> iterator = values.iterator();
        while (iterator.hasNext()){
            System.out.println(iterator.next());
        }

    }
}
