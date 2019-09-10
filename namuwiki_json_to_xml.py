import ijson
 
path = '/input/AIRLab/nmt/corpus.crawl/mono/ko/namuwiki/raw/namuwiki_20190312.json'
template_opener="<mediawiki xml:lang=\"en\"> \
    <siteinfo><sitename>나무위키</sitename><dbname>namuwiki</dbname>\
    <base>https://namu.wiki/w/%EB%82%98%EB%AC%B4%EC%9C%84%ED%82%A4:%EB%8C%80%EB%AC%B8</base> \
    <namespaces></namespaces></siteinfo>" 
template_closer="</mediawiki>"

def load_json(filename):
    with open(filename, 'r') as fd, open(filename + '.out', 'w') as fo:
        parser = ijson.parse(fd)
        fo.write("{}\n".format(template_opener))
        for prefix, event, value in parser:
            if prefix.endswith('.title'):
                #print("\nTITLE: %s" % value)
                fo.write("<page>\n".format(value))
                fo.write("<title>{}</title>\n".format(value))
            elif prefix.endswith('.text'):
                #print("\nCONTENT: %s" % value)
                fo.write("<text xml:space=\"preserve\"{}</text>\n".format(value))
                fo.write("</page>\n".format(value))
        fo.write("{}\n".format(template_closer))
 
if __name__ == "__main__":
    load_json(path)
