def app(environ, start_response):
    data = b''
    
    args = ''
    queryList = environ['QUERY_STRING'].split('&')
    for arg in queryList:
        args += arg  
        args += '\n'

    args_bytes = bytes(args)
    data = data + args_bytes


    status = '200 OK'
    response_headers = [
        ('Content-type', 'text/plain'),
        ('Content-Length', str(len(data)))
    ]
    start_response(status, response_headers)
    return iter([data])

