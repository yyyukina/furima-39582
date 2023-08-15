require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '配送先情報の保存' do
    before do
      @order_form = FactoryBot.build(:order_form)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_form).to be_valid
      end
      it 'building_nameは空でも保存できる' do
        @order_form.building_name = nil
        expect(@order_form).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できない' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが「3桁+ハイフン+4桁」の組み合わせでないと保存できない' do
        @order_form.postal_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_codeが半角でないと保存できない' do
        @order_form.postal_code = '０００００００'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'region_idを選択していないと保存できない' do
        @order_form.region_id = 0
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Region can't be blank")
      end
      it 'cityが空だと保存できない' do
        @order_form.city = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it 'address_lineが空だと保存できない' do
        @order_form.address_line = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address line can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @order_form.phone_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberにハイフンがあると保存できない' do
        @order_form.phone_number = '123 - 1234 - 1234'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
      end
      it 'phone_numberが12桁以上あると保存できない' do
        @order_form.phone_number = 12_345_678_910_123_111
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
      end
      it 'phone_numberが半角でないと保存できない' do
        @order_form.phone_number = '００００'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
      end
      it 'itemが紐付いていないと保存できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
      it 'userが紐づいていないと保存できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it 'トークンが空だと保存できない' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
      
    end
  end
  
end
