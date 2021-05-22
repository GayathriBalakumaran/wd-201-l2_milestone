input_path=ARGV

def printed_output(hash,array,input_path)
   hash.each do|key,value|
     if(value[0] == "A" && value[1] == input_path )
       return array << value[2]
     elsif(value[0] == "CNAME" && value[1] == input_path)
       array << value[2]
       return printed_output(hash,array,value[2]);
     end
   end
   array[0] = "Error: record not found for #{input_path}"
   return array
end

if(input_path[0] == nil)
  puts ("Error: the file not found an Input")
else
  hash={}
  i=1
  File.readlines("zone").each do|line|
    if(line[0] === '#' or line[0] === "\r\n")
      line == File.readlines("zone").delete(line)
    else
      line=line.strip
      line=line.split(", ")
      hash[i]=line
      i=i+1
   end
  end
  input_path=input_path[0]
  array=[input_path]
  way_printed=printed_output(hash,array,input_path)
  puts array.join("=>")
end