#=
s:
- Julia version: 1.4.2
- Author: alicsharp, Muhammet Ali Öztürk
- Date: 2020-11-09
=#

mutable struct Graph
   connections
end

g = Graph(Dict())

mutable struct Node
    name
    adjacents
    visited
end

zero = Node("0",[],false)
one = Node("1",[],false)
two = Node("2",[],false)
three = Node("3",[],false)

function addEdge(graph, node_u, node_v)
    graph.connections[node_u] = node_v
    push!(node_u.adjacents, node_v)
end

addEdge(g,zero,one)
addEdge(g,zero,two)
addEdge(g,one,two)
addEdge(g,two,zero)
addEdge(g,two,three)
addEdge(g,three,three)


function BFS(s)
    queue = []
    push!(queue,s)
    s.visited = true

    while queue != []
        s = pop!(queue)
        println(s.name, " ")
        for node in s.adjacents
            if !(node.visited)
                push!(queue, node)
                node.visited = true
            end
        end
    end
end

BFS(two)