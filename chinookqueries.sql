
--1
  Select [Name] = FirstName + ' ' + LastName, CustomerId, Country
  From Customer
  Where Company != 'USA'

--2
  Select *
  From Customer
  Where Country = 'Brazil'

--3
  Select [Name] = FirstName + ' ' + LastName, InvoiceId, InvoiceDate, BillingCountry
  From Customer
  Join Invoice on Country = 'Brazil'

--4
  Select *
  From Employee
  Where Title = 'Sales Support Agent'

--5
  Select distinct BillingCountry
  From Invoice

--6
  Select Invoice.*, [Agent Name] = Employee.FirstName + ' ' + Employee.LastName
  From Customer
  Join Employee on EmployeeId = SupportRepId
  Join Invoice on Invoice.CustomerId = Customer.CustomerId
  Order by [Agent Name]

--7
  Select Invoice.Total, [Customer Name] = Customer.FirstName + ' ' + Customer.LastName, Invoice.BillingCountry, [Agent Name] = Employee.FirstName + ' ' + Employee.LastName
  From Customer
  Join Employee on EmployeeId = SupportRepId
  Join Invoice on Invoice.CustomerId = Customer.CustomerId
  Order by [Agent Name], [Customer Name]
  
--8

--9

--10
  Select [Number of Invoice Lines] = COUNT (*)
  From InvoiceLine
  Where InvoiceId = 37

--11
  Select InvoiceId, [Number of Invoice Lines] = Count (*)
  From InvoiceLine
  Group by InvoiceId

--12
  Select Track.Name, InvoiceLine.* 
  From InvoiceLine
  Join Track on Track.TrackId = InvoiceLine.TrackId

--13
  Select [Artist Name] = Artist.Name, [Track Name] = Track.Name, InvoiceLine.* 
  From InvoiceLine
  Join Track on Track.TrackId = InvoiceLine.TrackId
  Join Album on Album.AlbumId = Track.AlbumId
  Join Artist on Artist.ArtistId = Album.ArtistId

--14
  Select BillingCountry, [Number of Invoices] = Count (*)
  From Invoice
  Group by BillingCountry

  --15 Needs more work
  Select [Number of tracks] = COUNT (*) 
  From Playlist
  Join PlaylistTrack on PlaylistTrack.PlaylistId = Playlist.PlaylistId
  group by PlaylistTrack.PlaylistId
  -- Needs more work

--16
  Select Track.Name, Track.Composer, [Album] = Album.Title, [Genre] = Genre.Name, [Media Type] = MediaType.Name,
  Track.UnitPrice, Track.Milliseconds, Track.Bytes
  From Track
  Join Genre on Genre.GenreId = Track.GenreId
  Join Album on Album.AlbumId = Track.AlbumId
  Join MediaType on MediaType.MediaTypeId = Track.MediaTypeId

   --17 Needs more work
  Select [Number of invoice lines] = Count (*) 
  From Invoice
  Join InvoiceLine on InvoiceLine.InvoiceId = Invoice.InvoiceId
  Group by InvoiceLine.InvoiceId
   -- Needs more work

     --18 Needs more work
   Select [Number of Sales] = Count (*)
   From Invoice
   Join Customer on Customer.CustomerId = Invoice.CustomerId
   Join Employee on Customer.SupportRepId = Employee.EmployeeId
   Group by EmployeeId
     -- Needs more work

--19 Needs more work
   Select [Number of Sales] = count (*)
   From Invoice
   Join Customer on Customer.CustomerId = Invoice.CustomerId
   Join Employee on Customer.SupportRepId = Employee.EmployeeId
   Group by EmployeeId
   
--20 Needs more work
	Select [Number of Sales] = count (*)
   From Invoice
   Join Customer on Customer.CustomerId = Invoice.CustomerId
   Join Employee on Customer.SupportRepId = Employee.EmployeeId
   Group by EmployeeId

--21 Needs more work
	Select [Number of Customers] = count (*)
	From Customer
	Join Employee on Customer.SupportRepId = Employee.EmployeeId
	Group by EmployeeId

--22 
	Select BillingCountry, [Number of Sales] = count (*)
	From Invoice
	Group by BillingCountry

--23 Needs more work
	Select BillingCountry, sum (Total)
	From Invoice
	Group by BillingCountry

--24 

--25
	Select top (5) InvoiceLine.TrackId, [Number of Sales] = count (*)
	From InvoiceLine
	Join Invoice on Invoice.InvoiceId = InvoiceLine.InvoiceId
	Group by InvoiceLine.TrackId
	Order by [Number of Sales] desc