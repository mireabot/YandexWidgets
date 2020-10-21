//
//  WidgetCollection.swift
//  WidgetCollection
//
//  Created by Mikhail Kolkov  on 23.09.2020.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: TimelineProvider {
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), mystring: "...")
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .second, value: hourOffset * 10, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, mystring: "Temp String")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), mystring: "....")
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let mystring: String
}

struct WidgetCollectionEntryView : View {
    var entry: Provider.Entry
    @State var width = UIScreen.main.bounds.width
    var body: some View {
        VStack(spacing: 10) {
            
            HStack {
                Text("Ваша почта")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                Spacer()
                Image("mail")
                    .resizable()
                    .frame(width:43,height: 24)
            }.padding()
           // Spacer(minLength: 0)
            VStack(spacing:5){
                HStack(spacing: 10) {
                        Image(systemName: "circle.fill")
                            .font(.system(size: 15))
                            .foregroundColor(Color("Color1"))
                    VStack(alignment: .leading, spacing: 4){
                        Text("yandex@ya.ru")
                            .fontWeight(.bold)
                            .font(.system(size: 19))
                        Text("Работа")
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                    }
                    Spacer()
                    Text("10:44")
                }.padding()
                .background(Color(.white))
                .cornerRadius(15)
                .frame(width: (UIScreen.main.bounds.width - 100))
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 5, y: 5)
                .shadow(color: Color.white.opacity(0.5), radius: 10, x: -8, y: -8)
                
                HStack(spacing: 10) {
                        Image(systemName: "circle.fill")
                            .font(.system(size: 15))
                            .foregroundColor(Color("Color1"))
                    VStack(alignment: .leading, spacing: 4){
                        Text("yandex@ya.ru")
                            .fontWeight(.bold)
                            .font(.system(size: 19))
                        Text("Работа")
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                    }
                    Spacer()
                    Text("10:44")
                }.padding()
                .background(Color(.white))
                .cornerRadius(15)
                .frame(width: (UIScreen.main.bounds.width - 100))
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 5, y: 5)
                .shadow(color: Color.white.opacity(0.5), radius: 10, x: -8, y: -8)
                HStack(spacing: 10) {
                        Image(systemName: "circle.fill")
                            .font(.system(size: 15))
                            .foregroundColor(Color("Color1"))
                    VStack(alignment: .leading, spacing: 4){
                        Text("yandex@ya.ru")
                            .fontWeight(.bold)
                            .font(.system(size: 19))
                        Text("Работа")
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                    }
                    Spacer()
                    Text("10:44")
                }.padding()
                .background(Color(.white))
                .cornerRadius(15)
                .frame(width: (UIScreen.main.bounds.width - 100))
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 5, y: 5)
                .shadow(color: Color.white.opacity(0.5), radius: 10, x: -8, y: -8)
                Spacer(minLength: 0)
                Spacer(minLength: 0)
            }
            
        }
    }
}

@main
struct WidgetCollection: Widget {
    let kind: String = "WidgetCollection"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
                WidgetCollectionEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemLarge, .systemMedium])
    }
}

struct WidgetCollection_Previews: PreviewProvider {
    static var previews: some View {
        WidgetCollectionEntryView(entry: SimpleEntry(date: Date(), mystring: " "))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
            
    }
}

/// БЕРУ
/*VStack(spacing: 10) {
    
    HStack {
        Text("Ваши заказы")
            .fontWeight(.bold)
            .font(.system(size: 20))
        Spacer()
        Image("beru")
            .resizable()
            .frame(width:56,height: 56)
    }.padding()
    Spacer(minLength: 10)
    VStack(spacing:5){
        HStack {
            Text("#1323456")
            Spacer()
            HStack(spacing:7) {
                Image(systemName: "circle.fill")
                    .font(.system(size: 10))
                    .foregroundColor(.green)
                Text("В пути")
                    .fontWeight(.light)
                    .font(.system(size: 15))
            }
        }.padding()
        .background(Color(.white))
        .cornerRadius(15)
        .frame(width: (UIScreen.main.bounds.width - 100))
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 5, y: 5)
        .shadow(color: Color.white.opacity(0.5), radius: 10, x: -8, y: -8)
        
        HStack {
            Text("#4653422")
            Spacer()
            HStack(spacing:7) {
                Image(systemName: "circle.fill")
                    .font(.system(size: 10))
                    .foregroundColor(.orange)
                Text("В обработке")
                    .fontWeight(.light)
                    .font(.system(size: 15))
            }
        }.padding()
        .background(Color(.white))
        .cornerRadius(15)
        .frame(width: (UIScreen.main.bounds.width - 100))
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 5, y: 5)
        .shadow(color: Color.white.opacity(0.5), radius: 10, x: -8, y: -8)
        HStack {
            Text("#9450334461")
            Spacer()
            HStack(spacing:7) {
                Image(systemName: "circle.fill")
                    .font(.system(size: 10))
                    .foregroundColor(.purple)
                Text("У вас")
                    .fontWeight(.light)
                    .font(.system(size: 15))
            }
        }.padding()
        .background(Color(.white))
        .cornerRadius(15)
        .frame(width: (UIScreen.main.bounds.width - 100))
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 5, y: 5)
        .shadow(color: Color.white.opacity(0.5), radius: 10, x: -8, y: -8)
      //  Spacer(minLength: 0)
        
        Button(action: {
            
        }){
            Text("Открыть еще")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding(.vertical)
                .cornerRadius(10)
                .frame(width: self.width - 100)
                .background(Color("Color"))
                .clipShape(Capsule())
                .padding(12)
        }.padding()
        Spacer(minLength: 0)
    }
    
}
*/
// МЕТРО
/*VStack(spacing: 0) {
    HStack {
        VStack(spacing:3){
            HStack {
                Text("В пути 1 час 48 минут")
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                Spacer()
            }
        }
        
        Spacer()
        Image("metro")
            .resizable()
            .frame(width:36,height: 26)
    }.padding()
    HStack(spacing:5) {
        Text("Охотный ряд")
            .fontWeight(.light)
            .font(.system(size: 9))
        Rectangle()
            .foregroundColor(.red)
            .frame(width: 10, height: 5)
        Text("Театральная")
            .fontWeight(.light)
            .font(.system(size: 8))
        Rectangle()
            .foregroundColor(.green)
            .frame(width: 10, height: 5)
        Text("Тульская")
            .fontWeight(.light)
            .font(.system(size: 12))
        Rectangle()
            .foregroundColor(.gray)
            .frame(width: 10, height: 5)
        Text("Нагатинская")
            .fontWeight(.light)
            .font(.system(size: 11))
    }.padding()
    .background(Color(.white))
    .cornerRadius(15)
    .frame(width: (UIScreen.main.bounds.width - 60))
    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 5, y: 5)
    .shadow(color: Color.white.opacity(0.5), radius: 10, x: -8, y: -8)
    HStack(spacing:1){
        Circle()
            .foregroundColor(.red)
            .frame(width: 20, height: 20)
        Rectangle()
            .foregroundColor(.red)
            .frame(width: 111, height: 5)
        Circle()
            .foregroundColor(.green)
            .frame(width: 20, height: 20)
        Rectangle()
            .foregroundColor(.green)
            .frame(width: 68, height: 5)
        Circle()
            .foregroundColor(.gray)
            .frame(width: 20, height: 20)
        Rectangle()
            .foregroundColor(.gray)
            .frame(width: 47, height: 5)
        Circle()
            .foregroundColor(.gray)
            .frame(width: 20, height: 20)
            
        
    }
    Spacer(minLength: 0)
}
*/
/// ДЕНЬГИ
/*
 VStack(spacing: 10){
     HStack{
         Text("Ваши финансы")
             .fontWeight(.bold)
         Spacer()
         Image("dengi")
             .resizable()
             .frame(width:46,height: 36)
     }.padding()
     HStack{
                         
         VStack(alignment: .leading, spacing: 8) {
                             
             Text("1700 руб.")
                 .font(.title)
                 .fontWeight(.bold)
                             
             Text("Текущий баланс")
             }
                         
             Spacer()
                         
             Button(action: {
                             
                 }) {
                             
                     Image(systemName: "plus")
                         .foregroundColor(.yellow)
                         .font(.system(size: 30))
                         
                 }
             }
                 .padding(20)
                 .frame(width: (UIScreen.main.bounds.width - 100))
                 .background(Color.black.opacity(0.05))
                 .cornerRadius(20)
                 .padding(.top)
     
     Row1()
         .padding()
     Button(action: {
         
     }){
         Text("Открыть еще")
             .foregroundColor(.white)
             .fontWeight(.bold)
             .padding(.vertical)
             .cornerRadius(10)
             .frame(width: self.width - 100)
             .background(Color("Color1"))
             .clipShape(Capsule())
             .padding(12)
     }.padding()
    // Spacer(minLength: 0)
 }
 
}
}
struct Row1 : View {

var body : some View{
 
 HStack(alignment: .top){
     
     Button(action: {
         
     }) {
         
         VStack(spacing: 2){
             
             VStack{
                 
                 Image(systemName: "phone").renderingMode(.original)
                 
             }.padding()
             .background(Color.black.opacity(0.05))
             .cornerRadius(10)
         }
     }
     
     Spacer(minLength: 0)
     
     Button(action: {
         
     }) {
         
         VStack(spacing: 8){
             
             VStack{
                 
                 Image(systemName: "creditcard").renderingMode(.original)
                 
             }.padding()
             .background(Color.black.opacity(0.05))
             .cornerRadius(10)
         }
     }
     
     Spacer(minLength: 15)
     
     Button(action: {
         
     }) {
         
         VStack(spacing: 8){
             
             VStack{
                 
                 Image(systemName: "wifi").renderingMode(.original)
                 
             }.padding()
             .background(Color.black.opacity(0.05))
             .cornerRadius(10)
             
             
         }
     }
     
     Spacer(minLength: 15)
     
     Button(action: {
         
     }) {
         
         VStack(spacing: 8){
             
             VStack{
                 
                 Image(systemName: "gamecontroller").renderingMode(.original)
                 
             }.padding()
             .background(Color.black.opacity(0.05))
             .cornerRadius(10)
             
             
         }
     }
 }
 */
// ПОЧТА
/*
 VStack(spacing: 10) {
     
     HStack {
         Text("Ваша почта")
             .fontWeight(.bold)
             .font(.system(size: 20))
         Spacer()
         Image("mail")
             .resizable()
             .frame(width:43,height: 24)
     }.padding()
    // Spacer(minLength: 0)
     VStack(spacing:5){
         HStack(spacing: 10) {
                 Image(systemName: "circle.fill")
                     .font(.system(size: 15))
                     .foregroundColor(Color("Color1"))
             VStack(alignment: .leading, spacing: 4){
                 Text("yandex@ya.ru")
                     .fontWeight(.bold)
                     .font(.system(size: 19))
                 Text("Работа")
                     .font(.system(size: 18))
                     .fontWeight(.semibold)
             }
             Spacer()
             Text("10:44")
         }.padding()
         .background(Color(.white))
         .cornerRadius(15)
         .frame(width: (UIScreen.main.bounds.width - 100))
         .shadow(color: Color.black.opacity(0.1), radius: 10, x: 5, y: 5)
         .shadow(color: Color.white.opacity(0.5), radius: 10, x: -8, y: -8)
         
         HStack(spacing: 10) {
                 Image(systemName: "circle.fill")
                     .font(.system(size: 15))
                     .foregroundColor(Color("Color1"))
             VStack(alignment: .leading, spacing: 4){
                 Text("yandex@ya.ru")
                     .fontWeight(.bold)
                     .font(.system(size: 19))
                 Text("Работа")
                     .font(.system(size: 18))
                     .fontWeight(.semibold)
             }
             Spacer()
             Text("10:44")
         }.padding()
         .background(Color(.white))
         .cornerRadius(15)
         .frame(width: (UIScreen.main.bounds.width - 100))
         .shadow(color: Color.black.opacity(0.1), radius: 10, x: 5, y: 5)
         .shadow(color: Color.white.opacity(0.5), radius: 10, x: -8, y: -8)
         HStack(spacing: 10) {
                 Image(systemName: "circle.fill")
                     .font(.system(size: 15))
                     .foregroundColor(Color("Color1"))
             VStack(alignment: .leading, spacing: 4){
                 Text("yandex@ya.ru")
                     .fontWeight(.bold)
                     .font(.system(size: 19))
                 Text("Работа")
                     .font(.system(size: 18))
                     .fontWeight(.semibold)
             }
             Spacer()
             Text("10:44")
         }.padding()
         .background(Color(.white))
         .cornerRadius(15)
         .frame(width: (UIScreen.main.bounds.width - 100))
         .shadow(color: Color.black.opacity(0.1), radius: 10, x: 5, y: 5)
         .shadow(color: Color.white.opacity(0.5), radius: 10, x: -8, y: -8)
         Spacer(minLength: 0)
         Spacer(minLength: 0)
     }
     
 }
 */
// ТАКСИ
/*
 VStack(spacing: 10){
     HStack {
         Text("Последние поездки")
             .fontWeight(.bold)
             .font(.system(size: 20))
         Spacer()
         Image("taxi")
             .resizable()
             .frame(width:24,height: 24)
     }.padding()
     Spacer(minLength: 0)
     HStack {
         VStack(alignment: .leading,spacing: 60) { // карточки
             HStack(spacing: 5){
                 VStack(spacing: 10) {
                     HStack {
                         Image("arrows")
                             .resizable()
                             .frame(width: 24, height: 24)
                         Text("Эконом")
                             .fontWeight(.bold)
                             .font(.system(size: 20))
                         Spacer(minLength: 0)
                     }
                     VStack(alignment: .leading,spacing: 5) {
                         
                         HStack {
                             Image(systemName: "circle.fill")
                                 .font(.system(size: 10))
                                 .foregroundColor(.red)
                             Text("ул.Льва Толстого 16")
                                 .fontWeight(.bold)
                                 .font(.system(size: 15))
                         }
                         HStack {
                             Image(systemName: "circle.fill")
                                 .font(.system(size: 10))
                                 .foregroundColor(.blue)
                             Text("ул.Льва Толстого 10")
                                 .fontWeight(.bold)
                                 .font(.system(size: 15))
                         }
                     }
                     Text("10 минут")
                         .font(.callout)
                         .fontWeight(.semibold)
                 }.padding()
                 .background(Color(.white))
                 .cornerRadius(15)
                 .frame(width: 206,height: 92)
                 .shadow(color: Color.black.opacity(0.1), radius: 10, x: 5, y: 5)
                 .shadow(color: Color.white.opacity(0.5), radius: 10, x: -8, y: -8)
                 
                 Button(action: {
                     
                 }){
                     Text("Заказать")
                         .foregroundColor(.black)
                         .fontWeight(.bold)
                         .padding(.vertical)
                         .cornerRadius(10)
                         .frame(width: self.width - 300)
                         .background(Color("Color1"))
                         .clipShape(Capsule())
                         .padding(12)
                 }
             }
             
             HStack(spacing: 5){
                 VStack(spacing: 10) {
                     HStack {
                         Image("arrows")
                             .resizable()
                             .frame(width: 24, height: 24)
                         Text("Комфорт +")
                             .fontWeight(.bold)
                             .font(.system(size: 20))
                         Spacer(minLength: 0)
                     }
                     VStack(alignment: .leading,spacing: 5) {
                         
                         HStack {
                             Image(systemName: "circle.fill")
                                 .font(.system(size: 10))
                                 .foregroundColor(.red)
                             Text("ул.Льва Толстого 16")
                                 .fontWeight(.bold)
                                 .font(.system(size: 15))
                         }
                         HStack {
                             Image(systemName: "circle.fill")
                                 .font(.system(size: 10))
                                 .foregroundColor(.blue)
                             Text("ул.Льва Толстого 10")
                                 .fontWeight(.bold)
                                 .font(.system(size: 15))
                         }
                     }
                     Text("10 минут")
                         .font(.callout)
                         .fontWeight(.semibold)
                 }.padding()
                 .background(Color(.white))
                 .cornerRadius(15)
                 .frame(width: 206,height: 92)
                 .shadow(color: Color.black.opacity(0.1), radius: 10, x: 5, y: 5)
                 .shadow(color: Color.white.opacity(0.5), radius: 10, x: -8, y: -8)
                 
                 Button(action: {
                     
                 }){
                     Text("Заказать")
                         .foregroundColor(.black)
                         .fontWeight(.bold)
                         .padding(.vertical)
                         .cornerRadius(10)
                         .frame(width: self.width - 300)
                         .background(Color("Color1"))
                         .clipShape(Capsule())
                         .padding(12)
                 }
             }
         }
     }
     Spacer(minLength: 0)
 }
 */
