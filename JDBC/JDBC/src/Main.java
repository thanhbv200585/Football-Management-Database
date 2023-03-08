import model.Stadium;
import query.Insert;
import query.Search;

public class Main {

    public static void main(String[] args) throws Exception {
        
        try {
            System.out.println("====================================================");
            System.out.println("Test viewer role");
            Search search1 = new Search("football_management_system", "viewer2", "password2");
            search1.searchPlayerInfor("Gabriel");
            System.out.println("====================================================");
            System.out.println("");
            Insert insert1 = new Insert("football_management_system", "viewer2", "password2");
            insert1.insertStadiumInfor(new Stadium("Nam Dinh", "Thien Truong", 20000));
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        System.out.println("Exiting...");
    
        try {
            System.out.println("====================================================");
            System.out.println("Test team_leader role");
            Search search2 = new Search("football_management_system", "team_leader1", "password5");
            search2.searchPlayerInfor("Gabriel");
            System.out.println("====================================================");
            System.out.println("");
            Insert insert2 = new Insert("football_management_system", "team_leader1", "password5");
            insert2.insertStadiumInfor(new Stadium("Nam Dinh", "Thien Truong", 20000));
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        System.out.println("Exiting...");
    }

}