@isTest
public class LeadBatchTest {
	@isTest
        static void executeBatch(){
            LeadBatch mybatch = new LeadBatch();
            Database.executeBatch(mybatch);
        }
}