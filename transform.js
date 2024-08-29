require('fs')
.writeFileSync('newest.csv',Object.values(
JSON.parse((require('fs').readFileSync('index-v2.json'))).packages).map((p)=>Object.values(p.versions).map((v=>({d:v.added, n: v.src && 'name' in v.file?v.file.name:''}))).sort((a,b)=>b.d-a.d)[0]).flat().filter(e=>e.n).sort((a,b)=>b.d-a.d).map(e=>`${e.d}\t${e.n}`).join('\n'))

