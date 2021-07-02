# S O B E R - P O N G

This is the classic Pong game, with sober colors and layout, 
but with a little extended behaviour

![Main Game](../assets/main_game.png)

## Characteristics

Characteristics about performance:

### Ball initialization

The direction of the movement is set following a linear 
distribution in cos(theta), where theta is the 360 degrees arch.

### Palettes

They don't have flat colission with the ball, because their 
collision shape are pentagons like this

![Collision Polygon](../assets/collision_polygon.png)

and the direction of the ball will be affected after such collision.

Each time the ball hits one palette, its speed is increased a 5% of 
its previous speed.

### Opponent

He is a silly artificial intelligence who follows the ball when it 
is traveling to the right and while it is near the palette.


### Game Over

The game is time-infinite, but each time a player earns a point, a fast countdown appears and the ball is restarted again with a random direction


