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

