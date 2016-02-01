# Learning Elixir

This repo is a whole bunch of files that I wrote to learn Elixir and some instructions too.

Say hi on Twitter: [@AndrewDuck_](https://twitter.com/AndrewDuck_)

## Hello World and all that stuff with Elixir

To get an interactive thing up, you write ```iex```. That stands for interactive elixir.

Elixir files have an ```.ex``` or ```.exs``` extension. 

The difference between the two are .exs files are for scripting and code that doesn't get compiled. ```.ex``` files are for compiling. Most code for production, other than tests and prototyping, should therefore be in an ```.ex``` file.

To run an ```.exs``` file you use ```elixir [[filename.exs]]```.

To run an ```.exs``` file within the ```iex``` interactive shell, you run ```iex [[filename.exs]]```

To compile an ```.ex``` file you run: ```elixirc filename.ex```. This creates your "bytecode" which can be used by your ```iex``` interactive shell.

### Creating a Hello World file

To make the console say hello world you need to call up the standard library module ```IO```. This lets you do stuff with the console and files and other things.

Within the ```IO``` module is a whole raft of functions. The function ```puts``` outputs your data type. If this looks a little bit like Ruby, that is not coincidence.

Like JavaScript and most function/method based languages, you access the ```puts``` function by chaining with a ```.```. So, to output something to the console you write:

```elixir
IO.puts "Hello World!"
```

### Declaring a variable

You declare a variable like most languages.

```elixir
message = "Hiya"
```
You don't declare the "type" (int, string etc etc)

Elixir is a pattern matching language. So rather than assignment, the ```=``` operator is a match operator. To see what this means in depth see [the official docs on pattern matching](http://elixir-lang.org/getting-started/pattern-matching.html)

### Creating a function

There are two ways you generally declare functions. Within a module, and anonymously.

To create an anonymous function that doubles an integer you write:

```elixir
double = fn a -> a * 2 end
```

Note the use of ```fn``` to declare double as a function. After that "keyword", we write our placeholders that are assigned any inputs. We then use ```->``` to write the code within the function, ending with the end keyword

To call this function we write:

```elixir
double.(1)
```

This will output 2. Note the ```.``` between double and the brackets for anonymous functions.

The other way to create functions are within modules. Putting the module part aside you write your functions like Ruby or Python methods:

```elixir
def double(a) do
  a * 2
end
```

To call this we would need the module name, taking it as ```Math```, we would call:

```elixir
Math.double(1)
```

Which would return 2 as before.

### Making a module

To create a module you must use the ```defmodule``` keyword. You use CamelCase when writing a module name. Modules are quite similar to Classes in many ways but don't do inheritance as you may expect coming from Ruby etc.

Let's create a module called "InstaPoem". Our definition starts by writing:

```elixir
defmodule InstaPoem do
 # code inside here
end
```

Modules are basically our libraries of functions. So let's create a function. Here is a simple function inside our InstaPoem module:

```elixir
defmodule InstaPoem do

  def recite(first, last) do
  
    first <> " is the first thing I think of when i hear " <> last
    
  end
  
end
```

Here we have defined a function called recite which takes two arguments. Inside our function we concatenate our first argument with a line and finish it off concatenating it with our last argument.

So, calling it we write:

```elixir
InstaPoem.recite("float", "boat")
```

This will output "float is the first thing I think of when i hear boat". Lovely.

> The ```<>``` operator is a concatenating technique

Something worth noting in Elixir is that it is pretty common to see two functions within a module use the same name.

This is pretty different from other object-oriented languages.

Although this can naturally be a little confusing, it allows Elixir developers to create complete handling of function parameters. The below is a module with a single function that takes someone's offer and rejects it. Pretty rubbish so far

```elixir
defmodule Barter do
    
    def response(offer) do
    
    "#{offer}? No deal"
    
    end

end
```

The ```#{}``` bit injects our variable into our string just like Ruby. So, even if we offer a 100000 we are getting a rejected offer.

Rather than handle the offer internally to this function, what we can do is create another tiny function, with the same name, that handles offers that we want to accept.

Below our first function, add the following:

```elixir
def response(offer) when offer > 5 do
  "#{offer}? YOU GOT A DEAL!"  
end
```

Here we have exactly the same name for our function but a "guard" which if a certain condition is met - in our case, anything over 5 - this particular function is used instead of our previous function.

So, we have two functions with the same name inside our module. 

> In Elixir you can tell the two apart by using this schema ```Barter.response/1``` and ```Barter.response/2```. The slash referring to ...


## Control Structures

As with other languages, you have control structures like if and unless.

```elixir

if true do
  "hi"
  else
  "bye"
end
```

If you need to use unless it is pretty similar:

```elixir

unless false do
  "impressive code"
  else
  "yawn"
end
```

It appears Elixir doesn't do else if stuff directly, rather preferring to use ```cond```. A bit like ```switch```.

```cond``` looks like:

```elixir

fart = "yuk"
smells = "pew"

cond do
  1 + 1 == 3 ->
    "errrr what?"
  fart == smells ->
    "yeah but it is natural"
  false or true ->
    "niiiice"
end
```

These are if statements. If you want an else if. Good luck with that.

If nothing is true in a cond structure and error is returned.

Case statements are also used.

```elixir
case :ok do
  "Looks spiffing here son"
end
```

### Maths and shit

Most of the common ones are there. + * / etc.

However, / always returns a float.

So ```10 / 2 ``` is 5.0. To not get a float, use div(10, 2)

# Structs

Structs are in some ways similar to classes.

Structs in Elixir are not entirely like Structs in other languages that are completely immutable (unchangeable once created at compile time). You can update them.

Structs can be useful in defining a group of data together in one record. Examples could be server or application configuration.

You create your Structs inside Modules like so:

```elixir
defmodule Website do

  defstruct user: "user@domain.com", sitename: "Exciting Marketing Website", loudness: 11 

end

```
To just print out the Struct, you write: ```%Website```.

To access the values within, you write Ruby like code:

```elixir

global = %Website{}
global.user # Will output the user name

```

One thing to note is that your Struct's fields are locked once compiled. So, if I wanted to create another field for this record, I would have to create that in the file pre-compile.

So, if i tried to use ```global.twitter``` it would cause an error.

We can also create new records with the values provided acting as default values.

```elixir

new_site = %Website{sitename: "Yet another blogspam site"} # This will use the initial values added to a struct if no new value is provided

```

This will create a new record. If we output ```%Website{}``` again, it will only show the last record created. So, best to use variables to handle Structs if you need to use them regularly.