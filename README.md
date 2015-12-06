# WarehouseDB
Warehouse DB Build


Website Designed to: 
1.	Login to Website
a.	Two Users   	
i.	Admin:  Fourway!
ii.	EcoFlex: 12345!

2.	View Inventory(ECOFLEX) and use asynchronous search functionality to find quantities in stock. Ecoflex  I do need another field named LOCID  “location” to show location.

3.	Audit Page(ECOFLEX) for incoming shipment.(EcoFlex)  - Upload a spreadsheet of expected inventory inbound -  parse data, rename to a database compliant table.    

Warehouse performs a scan of received items.

User selects a container No. and scan Discrepancies are output on a page.

i.e Missing Qty 5 pieces of Hardwood Sofa – White …  Reason: Not Scanned 
     Overage Qty 10 pieces of Black Chair… Reason: Not on inbound manifest 

Audit is per Container No.  So reports can be kept in the database per Container No for history.

4.	Shipment Order Creator(ECOFLEX)
a.	Type customer name/ address and select qty and item from database to ship.
b.	reuse some of the functionality of the search inventory page so they can quickly search and select items). 
c.	Ability to print the order
d.	Order created in database, and  can be edited.  But with timestamps of edits.
e.	Order can be searched for and has status pending or shipped.

5.	Inventory Search/Edit Page(ADMIN)
a.	Same search functionality, but ability to edit the quantity
b.	Timestamped edits are added as a new table. Which deducts from main data table.
Icon for manually edited field entry shown on search page.


6.	Order Review(ADMIN)
a.	Ability to see created orders.  Search by date or order no, item.
b.	Ability to add a memo to orders
c.	Ability to mark shipped

The other half is creating the barcode functionality to import data to the database.  I need to hear more about capabilities to detect edits and add data to database.  

