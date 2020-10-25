using Libdl


libllvm_paths = filter(Libdl.dllist()) do lib
    occursin(r"LLVM\b", basename(lib))
end

libllvm_paths

# julia_path = String(read(`where julia`))
julia_path = String(read(`which julia`))
julia_path_split = splitpath(julia_path)
julia_path = normpath(julia_path)

julia_path = replace(julia_path, r"(^\\c)" => s"C:")
julia_path = replace(julia_path, r"(\n)$" => s".exe")
julia_path = normpath(julia_path)
julia_path = realpath(julia_path)

julia_path = normpath(julia_path)

llvm_path = libllvm_paths[1]
llvm_path = normpath(llvm_path)
llvm_path = realpath(llvm_path)
splitpath(llvm_path)

map(x -> sum(splitpath(x) .∈ julia_path_split), libllvm_paths)
ENV["JULIA_HOME"]


sum(splitpath(llvm_path) .∈ Ref(julia_path_split))
