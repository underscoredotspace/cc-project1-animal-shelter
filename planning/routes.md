# Routes

## Home `/`
- [ ] List of all current animals available for adoption with their admission date in a table
- [ ] Link to animal details page `/animal/id`

## Animal details `/animal/id`
- [ ] List all animal details in a table
- [ ] Delete button -> **POST** `/animal/id/delete`
- [ ] Edit link
- [ ] Adopt link

## Edit animal `/animal/id/edit`
- [ ] All animal details in form
- [ ] Submit button -> **POST** `/animal/id/update`

## Adopt animal `/animal/id/adopt`
- [ ] Animal name, type and breed
- [ ] List of Customers who are approved to adopt
- [ ] Submit button -> **POST** `/animal/id/update`

## Customers who have adopted animals `/customer/adopters`
- [ ] List all adopters and their adopted animals
- [ ] Link to customer details page `/customer/id`
- [ ] Link to animal details page `/animal/id`