<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Copy_Type_to_One_Primary_User</fullName>
        <description>Enforce one primary user constraint</description>
        <field>One_Primary_User__c</field>
        <formula>IF(ISPICKVAL(Type__c, &quot;Primary&quot;), &quot;Primary&quot;, User__c)</formula>
        <name>Copy Type to One Primary User</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Copy_User_to_User_Is_Unique</fullName>
        <description>Enforce unique User constraint</description>
        <field>User_Is_Unique__c</field>
        <formula>User__c</formula>
        <name>Copy User to User Is Unique</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>User Changed</fullName>
        <actions>
            <name>Copy_User_to_User_Is_Unique</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>ISCHANGED(User__c) ||  ISNEW()</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>User or Type Changed</fullName>
        <actions>
            <name>Copy_Type_to_One_Primary_User</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>ISCHANGED(Type__c) || ISCHANGED(User__c) ||  ISNEW()</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
