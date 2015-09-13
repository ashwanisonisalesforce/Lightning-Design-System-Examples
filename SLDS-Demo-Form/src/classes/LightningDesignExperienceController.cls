public with sharing class LightningDesignExperienceController 
{
	public Account acc {get;set;}
	
	public LightningDesignExperienceController()
	{
		Account[] accList = [SELECT id, name, accountsource, description, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry, 
								(SELECT Name, Account.Name, Title, email
								FROM Contacts 
								LIMIT 5)
							FROM Account];
		if(accList.size()>0)
		{
			acc = accList[0];
		}
		else
		{
			acc = new Account();
		}
	}
	
	public void save()
	{
		upsert acc;
	}
	
	public void reset()
	{
		acc = new Account();
	}
}