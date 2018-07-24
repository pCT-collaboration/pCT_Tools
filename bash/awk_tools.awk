# awk_tools.awk
function cmp_num_idx(i1, v1, i2, v2)
{
     # numerical index comparison, ascending order
     return (i1 - i2)
}
function cmp_str_val(i1, v1, i2, v2)
{
    # string value comparison, ascending order
    v1 = v1 ""
    v2 = v2 ""
    if (v1 < v2)
        return -1
    return (v1 != v2)
}
function cmp_num_str_val(i1, v1, i2, v2,   n1, n2)
{
     # numbers before string value comparison, ascending order
     n1 = v1 + 0
     n2 = v2 + 0
     if (n1 == v1)
         return (n2 == v2) ? (n1 - n2) : -1
     else if (n2 == v2)
         return 1
     return (v1 < v2) ? -1 : (v1 != v2)
}
function foo() {
   print "Hello World"
}
    # BEGIN {
        # data["one"] = 10
        # data["two"] = 20
        # data[10] = "one"
        # data[100] = 100
        # data[20] = "two"

        # f[1] = "cmp_num_idx"
        # f[2] = "cmp_str_val"
        # f[3] = "cmp_num_str_val"
        # for (i = 1; i <= 3; i++) {
            # printf("Sort function: %s\n", f[i])
            # PROCINFO["sorted_in"] = f[i]
            # for (j in data)
                # printf("\tdata[%s] = %s\n", j, data[j])
            # print ""
        # }
    # }
    
# $ gawk -f compdemo.awk
# -| Sort function: cmp_num_idx      Sort by numeric index
# -|     data[two] = 20
# -|     data[one] = 10              Both strings are numerically zero
# -|     data[10] = one
# -|     data[20] = two
# -|     data[100] = 100
# -|
# -| Sort function: cmp_str_val      Sort by element values as strings
# -|     data[one] = 10
# -|     data[100] = 100             String 100 is less than string 20
# -|     data[two] = 20
# -|     data[10] = one
# -|     data[20] = two
# -|
# -| Sort function: cmp_num_str_val  Sort all numeric values before all strings
# -|     data[one] = 10
# -|     data[two] = 20
# -|     data[100] = 100
# -|     data[10] = one
# -|     data[20] = two
