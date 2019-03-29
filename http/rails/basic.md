
# installation 

`gem install rails`

note that it is _rails_ (not rail)

# creation

```
rails new basic
rake db:create
rake db:migrate
```

# test

```
cd basic
rails s
```

# add posting feature

```
rails g scaffold Post title:string content:text
rake db:migrate
rails s
```

# test posting

go to `localhost:3000/posts`


