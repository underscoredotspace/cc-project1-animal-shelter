# Routes

## Home `/`
- [x] List of all current animals available for adoption with their admission date in a table
- [x] Link to animal details page `/animal/id`

## Animal details `/animal/id`
- [x] List all animal details in a table
- [ ] ~~Delete button -> **POST** `/animal/id/delete`~~
- [x] Edit link
- [x] Adopt link

## Edit animal `/animal/id/edit`
- [x] All animal details in form
- [x] Submit button -> **POST** `/animal/id/edit`

## Adopt animal `/animal/id/adopt`
- [x] Animal name, type and breed
- [x] List of Customers who are approved to adopt
- [x] Submit button -> **POST** `/customer/id/adopt/animal_id`

## Customers who have adopted animals `/customer/adopters`
- [x] List all adopters and their adopted animals
- [x] Link to customer details page `/customer/id`
- [x] Link to animal details page `/animal/id`