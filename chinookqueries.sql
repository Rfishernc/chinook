
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
  Select [Number of sales] = count (*), [Year] = year (Invoice.InvoiceDate)
  From Invoice
  Where year(Invoice.InvoiceDate) = '2009' or year(Invoice.InvoiceDate)  = '2011'
  Group by year(Invoice.InvoiceDate) 

--9
  Select [Year] = year (Invoice.InvoiceDate), [Total Sales] = sum (Invoice.Total)
  From Invoice
  Where year(Invoice.InvoiceDate) = '2009' or year(Invoice.InvoiceDate)  = '2011'
  Group by year(Invoice.InvoiceDate) 

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

--15
  Select Playlist.Name, [Number of tracks] = COUNT (*) 
  From Playlist
  Join PlaylistTrack on PlaylistTrack.PlaylistId = Playlist.PlaylistId
  group by Playlist.PlaylistId, Playlist.Name

--16
  Select Track.Name, Track.Composer, [Album] = Album.Title, [Genre] = Genre.Name, [Media Type] = MediaType.Name,
  Track.UnitPrice, Track.Milliseconds, Track.Bytes
  From Track
  Join Genre on Genre.GenreId = Track.GenreId
  Join Album on Album.AlbumId = Track.AlbumId
  Join MediaType on MediaType.MediaTypeId = Track.MediaTypeId

  Select InvoiceLine.InvoiceId, [Number of invoice lines] = Count (*) into #temp
  From Invoice
  Join InvoiceLine on InvoiceLine.InvoiceId = Invoice.InvoiceId
  Group by InvoiceLine.InvoiceId

  Select * 
  From #temp
  Join Invoice on Invoice.InvoiceId = #temp.InvoiceId
  Drop table #temp

   Select [Number of Sales] = Count (*),  [Total Sales] = sum (Invoice.Total), [Name] = Employee.FirstName + ' ' + Employee.LastName
   From Invoice
   Join Customer on Customer.CustomerId = Invoice.CustomerId
   Join Employee on Customer.SupportRepId = Employee.EmployeeId
   Group by EmployeeId, Employee.FirstName, Employee.LastName

   Select top (1) [Total Sales] = sum (Invoice.Total), [Name] = Employee.FirstName + ' ' + Employee.LastName
   From Invoice
   Join Customer on Customer.CustomerId = Invoice.CustomerId
   Join Employee on Customer.SupportRepId = Employee.EmployeeId
   Where year (Invoice.InvoiceDate) = '2009'
   Group by EmployeeId, Employee.FirstName, Employee.LastName
   Order by [Total Sales] desc
   
	Select top (1) [Number of Sales] = count (*), [Name] = Employee.FirstName + ' ' + Employee.LastName
   From Invoice
   Join Customer on Customer.CustomerId = Invoice.CustomerId
   Join Employee on Customer.SupportRepId = Employee.EmployeeId
   Group by EmployeeId, Employee.FirstName, Employee.LastName
   Order by [Number of Sales] desc

	Select [Number of Customers] = count (*), [Name] = Employee.FirstName + ' ' + Employee.LastName
	From Customer
	Join Employee on Customer.SupportRepId = Employee.EmployeeId
	Group by EmployeeId, Employee.FirstName, Employee.LastName

--22 
	Select BillingCountry, [Number of Sales] = count (*)
	From Invoice
	Group by BillingCountry

--23
	Select top (1) BillingCountry, [Total Sales] = sum (Total)
	From Invoice
	Group by BillingCountry
	Order by [Total Sales] desc

--24
  Select top (1) [Number of Sales] = count (*), Track.Name
  From InvoiceLine
  Join Invoice on Invoice.InvoiceId = InvoiceLine.InvoiceId
  Join Track on InvoiceLine.TrackId = Track.TrackId
  Where year (Invoice.InvoiceDate) = '2013'
  Group by InvoiceLine.TrackId, Track.Name
  Order by [Number of Sales] desc   

--25
  Select top (5) InvoiceLine.TrackId, [Number of Sales] = count (*)
  From InvoiceLine
  Join Invoice on Invoice.InvoiceId = InvoiceLine.InvoiceId
  Group by InvoiceLine.TrackId
  Order by [Number of Sales] desc

--26
Select top (3) [Number of sales] = count (*), Artist.Name
  From InvoiceLine
  Join Invoice on Invoice.InvoiceId = InvoiceLine.InvoiceId
  Join Track on Track.TrackId = InvoiceLine.TrackId
  Join Album on Album.AlbumId = Track.AlbumId
  Join Artist on Artist.ArtistId = Album.AlbumId
  Group by Artist.ArtistId, Artist.Name
  Order by [Number of sales] desc
	
--27
  Select top (1) [Number of sales] = count (*), MediaType.Name
  From InvoiceLine
  Join Invoice on Invoice.InvoiceId = InvoiceLine.InvoiceId
  Join Track on Track.TrackId = InvoiceLine.TrackId
  Join MediaType on MediaType.MediaTypeId = Track.MediaTypeId
  Group by MediaType.MediaTypeId, MediaType.Name
  Order by [Number of sales] desc
