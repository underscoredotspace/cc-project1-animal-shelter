# Routes

## Home `/`
- [x] List of all current animals available for adoption with their admission date in a table
- [x] Link to animal details page `/animal/id`

## Animal details `/animal/id`
- [x] List all animal details in a table
- [ ] Delete button -> **POST** `/animal/id/delete`
- [x] Edit link
- [x] Adopt link

## Edit animal `/animal/id/edit`
- [x] All animal details in form
- [x] Submit button -> **POST** `/animal/id/edit`

## Adopt animal `/animal/id/adopt`
- [ ] Animal name, type and breed
- [ ] List of Customers who are approved to adopt
- [ ] Submit button -> **POST** `/animal/id/edit`

## Customers who have adopted animals `/customer/adopters`
- [ ] List all adopters and their adopted animals
- [ ] Link to customer details page `/customer/id`
- [ ] Link to animal details page `/animal/id`