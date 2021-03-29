const URL_POST = "https://jsonplaceholder.typicode.com/posts";
const URL_USERS = "https://jsonplaceholder.typicode.com/users";
const URL_COMMENTS = "https://jsonplaceholder.typicode.com/comments";
const URL_TODOS = "https://jsonplaceholder.typicode.com/todos";
const URL_PHOTOS = "https://jsonplaceholder.typicode.com/photos";
const URL_ALBUMS = "https://jsonplaceholder.typicode.com/albums";

function main() {
    loadDataSQL(URL_TODOS, "tempTodos", "todos");
    loadDataSQL(URL_PHOTOS, "tempPhotos", "photo");
    loadDataSQL(URL_ALBUMS, "tempAlbums", "album");
    loadDataCSV(URL_POST, "tempPosts", "post");
    loadDataCSV(URL_COMMENTS, "tempComments", "comment");
    loadUserSQL(URL_USERS);
}

function loadDataSQL(urlrest, filename, name) {

    var request = new XMLHttpRequest();
    request.open('GET', urlrest, true);
    request.send();
    request.onreadystatechange = function() {

        if (request.readyState == 4 && request.status == 200) {
            let json;
            json = JSON.parse(request.responseText);

            //Variable para llenar el SQL
            let SQL = "insert into " + filename + " (";
            let dato = "";
            //Obtener Keys
            let keys = Object.keys(json[0]);
            //llenar keys
            for (let i = 0; i < keys.length; i++) {

                if (i == keys.length - 1) {

                    if (keys[i] == "url") {
                        SQL = SQL + "urlDir" + "\n";
                    } else if (keys[i] == "name") {
                        SQL = SQL + "commentName" + "\n";
                    } else if (keys[i] == "id") {
                        SQL = SQL + name + "Id" + "\n";
                    } else {
                        SQL = SQL + keys[i] + "\n";
                    }

                } else {

                    if (keys[i] == "url") {
                        SQL = SQL + "urlDir" + ",";
                    } else if (keys[i] == "name") {
                        SQL = SQL + "commentName" + ",";
                    } else if (keys[i] == "id") {
                        SQL = SQL + name + "Id" + ",";
                    } else {
                        SQL = SQL + keys[i] + ",";
                    }

                }

            }
            SQL = SQL + ") values ";
            //llenar datos
            //primer for para iterar sobre los conjuntos de elementos
            for (let i = 0; i < json.length; i++) {
                dato = "(";
                //segundo for para iterar sobre los elementos
                for (let j = 0; j < keys.length; j++) {
                    let cleanData = "'" + json[i][keys[j]] + "'";

                    if (j == keys.length - 1) {
                        dato = dato + cleanData + "\n";
                    } else {
                        dato = dato + cleanData + ",";
                    }

                }

                if (i == (json.length - 1)) {
                    SQL = SQL + dato + ")";
                } else {
                    SQL = SQL + dato + "),";
                }
            }
            SQL += ";";
            exportSQL(SQL, filename);
        }
    };
}

function loadUserSQL(urlrest) {
    var tableUser = "tempUsers";
    var tableCity = "tempCity";
    var tableCompany = "tempCompany";

    var request = new XMLHttpRequest();
    request.open('GET', urlrest, true);
    request.send();
    request.onreadystatechange = function() {
        if (request.readyState == 4 && request.status == 200) {
            let json;
            json = JSON.parse(request.responseText);

            //Variables
            let userSQL = "insert into " + tableUser + "(userId, realName, userName, email, phone, website, cityId, companyId) values \n";
            let citySQL = "insert into " + tableCity + "(cityId, cityName, street, suite, zipCode, lat, lng) values \n";
            let companySQL = "insert into " + tableCompany + "(companyId, companyName, catchPhrase, bs) values \n";

            let cityCounter = 1;
            let companyCounter = 1;

            //Llenar datos
            //Primer for para iterar sobre los conjuntos de elementos
            for (let i = 0; i < json.length; i++) {
                let datoUser = "('" + json[i].id + "','" + json[i].name + "','" + json[i].username + "','" + json[i].email + "','" + json[i].phone + "','" + json[i].website + "','" + cityCounter + "','" + companyCounter + "')\n";
                let datoCity = "('" + cityCounter + "','" + json[i].address.city + "','" + json[i].address.street + "','" + json[i].address.suite + "','" + json[i].address.zipcode + "','" + json[i].address.geo.lat + "','" + json[i].address.geo.lng + "')\n";
                let datoCompany = "('" + companyCounter + "','" + json[i].company.name + "','" + json[i].company.catchPhrase + "','" + json[i].company.bs + "')\n";

                if (i == (json.length - 1)) {
                    userSQL += datoUser;
                    citySQL += datoCity;
                    companySQL += datoCompany;
                } else {
                    userSQL += datoUser + ",";
                    citySQL += datoCity + ",";
                    companySQL += datoCompany + ",";
                }
                cityCounter += 1;
                companyCounter += 1;
            }

            userSQL += ";";
            citySQL += ";";
            companySQL += ";";

            exportSQL(userSQL, "tempUsers");
            exportSQL(citySQL, "tempCity");
            exportSQL(companySQL, "tempCompany");
        }
    };
}

function exportSQL(SQL, filename) {
    //SQL
    var SQLFile = new Blob([SQL], { type: "text/SQL" });
    console.log(SQLFile);
    // Download link
    var downloadLink = document.createElement("a");
    downloadLink.download = filename + ".sql"; // File name
    downloadLink.href = window.URL.createObjectURL(SQLFile); // Create a link to the file
    downloadLink.style.display = "none"; // Hide download link
    document.body.appendChild(downloadLink); // Add the link to DOM
    downloadLink.click(); // Click download link
}

//CSV

function loadDataCSV(urlrest, filename, name) {

    var request = new XMLHttpRequest();
    request.open('GET', urlrest, true);
    request.send();
    request.onreadystatechange = function() {

        if (request.readyState == 4 && request.status == 200) {
            let json;
            json = JSON.parse(request.responseText);


            let csv = "";
            let dato = "";
            //Obtener Keys
            let keys = Object.keys(json[0]);
            //llenar keys
            // for (let i = 0; i < keys.length; i++) {

            //     if (i == keys.length - 1) {

            //         if (keys[i] == "url") {
            //             csv = csv + "urlDir" + "\n";
            //         } else if (keys[i] == "name") {
            //             csv = csv + "commentName" + "\n";
            //         } else if (keys[i] == "id") {
            //             csv = csv + name + "Id" + "\n";
            //         } else {
            //             csv = csv + keys[i] + "\n";
            //         }

            //     } else {

            //         if (keys[i] == "url") {
            //             csv = csv + "urlDir" + ",";
            //         } else if (keys[i] == "name") {
            //             csv = csv + "commentName" + ",";
            //         } else if (keys[i] == "id") {
            //             csv = csv + name + "Id" + ",";
            //         } else {
            //             csv = csv + keys[i] + ",";
            //         }

            //     }

            // }
            //llenar datos
            //primer for para iterar sobre los conjuntos de elementos
            for (let i = 0; i < json.length; i++) {
                dato = "";
                //segundo for para iterar sobre los elementos
                for (let j = 0; j < keys.length; j++) {
                    let cleanData = json[i][keys[j]];

                    if (keys[j] == "body") {
                        cleanData = cleanData.split("\n").join(" ");
                    }

                    if (j == keys.length - 1) {
                        dato = dato + cleanData + "\n";
                    } else {
                        dato = dato + cleanData + ",";
                    }

                }

                csv = csv + dato
            }
            exportCSV(csv, filename);
        }
    };
}

function exportCSV(csv, filename) {
    //SQL
    var csvFile = new Blob([csv], { type: "text/csv" });
    // Download link
    var downloadLink = document.createElement("a");
    downloadLink.download = filename + ".csv"; // File name
    downloadLink.href = window.URL.createObjectURL(csvFile); // Create a link to the file
    downloadLink.style.display = "none"; // Hide download link
    document.body.appendChild(downloadLink); // Add the link to DOM
    downloadLink.click(); // Click download link
}