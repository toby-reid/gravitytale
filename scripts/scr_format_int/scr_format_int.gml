function scr_format_int(value, str_len)
{
    var str = string_replace_all(string_format(value, str_len, 0), " ", "0");
    if (string_length(str) > str_len)
    {
        return string_copy(str, string_length(str) - str_len + 1, str_len);
    }
    return str;
}
