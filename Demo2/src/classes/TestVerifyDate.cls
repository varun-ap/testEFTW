@isTest
public class TestVerifyDate {
	@isTest static void testDate1() {
        Date myDate1 = Date.newInstance(1960, 2, 17);
        Date myDate2 = Date.newInstance(1960, 2, 20);
        Date pri = VerifyDate.CheckDates(myDate1,myDate2);
        System.assertEquals(myDate2, pri);
    }
    
    @isTest static void testDate2() {
        Date myDate2 = Date.newInstance(1960, 3, 17);
        Date myDate1 = Date.newInstance(1960, 3, 31);
        Date pri = VerifyDate.CheckDates(myDate1,myDate2);
        System.assertEquals(myDate1, pri);
    }
}