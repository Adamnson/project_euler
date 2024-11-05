// a post from Esteban8231
Array.from(document.getElementsByTagName("b")).map(x => x.textContent.split(" ").map(x => x[0]).join("")).join("")