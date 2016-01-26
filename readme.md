# Learning Elixir

This repo is a whole bunch of files that I wrote to learn Elixir and some instructions too.

Say hi on Twitter: [@AndrewDuck_](https://twitter.com/AndrewDuck_)

## Hello World and all that stuff with Elixir

To get an interactive thing up, you write ```iex```. That stands for interactive elixir.

Elixir files have an ```.exs``` extension. To run an ```.exs``` file you use ```elixir [[filename.exs]]```.

To run an ```.exs``` file within the ```iex``` interactive shell, you run ```iex [[filename.exs]]```

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


### Making a module