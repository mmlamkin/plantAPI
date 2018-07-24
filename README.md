# README

# plantAPI
API consisting of gardening data for various crops and herbs for a home garden.

## Functionality
This API was created for use with Sprout, a react native app

## Endpoints
### Plants

```
GET /plants
```
List all plants

```
GET /plants/:id
```
Show plant with that id

```
POST /plants
```
Create a plant with params name, description, optimal_sun, planting_considerations, growing_from_seed, when_to_plant, spacing, watering, other_care, pests, harvesting, image, early_harvest, and late_harvest -- all strings.

### Users

```
GET /users
```
List all users

```
GET /users/:id
```
Show user with that id

```
POST /users
```
Create user-required param is Email


### Gardens

```
PATCH  /users/:user_id/plants/:plant_id
```
Add a plant to a user's garden

```
DELETE /users/:user_id/plants/:plant_id
```
Delete a plant from a user's garden

```
DELETE /users/:user_id/gardens/:garden_id
```
Delete a user's garden

```
GET    /users/:user_id/gardens
```
 Index of a user's gardens



##Notes
