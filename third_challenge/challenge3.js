<!DOCTYPE html>
<html>
<title>Online Javascript Editor</title>

<head>
    <script>
        function sayHello() {

            const a = [{
                "b": {
                    "c": "d"
                }
            }];
            const x = [{
                "y": {
                    "z": "a"
                }
            }];

            const result = x.map(ref => ref.y.z);

            document.write(result);
        }
        console.log("hello");
        sayHello();
    </script>
</head>

<body>
</body>