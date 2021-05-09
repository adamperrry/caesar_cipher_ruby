require_relative '../lib/caesar_cipher'

describe CaesarCipher do
  describe '.encode' do
    context 'has positive shift' do
      it 'works with empty string' do
        expect(CaesarCipher.encode(string: '', shift: 5)).to eql('')
      end

      it 'works with all lowercase strings' do
        expect(CaesarCipher.encode(string: 'what', shift: 5)).to eql('bmfy')
      end

      it 'leaves non-letter characters alone' do
        expect(CaesarCipher.encode(string: 'what a string! 100%', shift: 5)).to eql('bmfy f xywnsl! 100%')
      end

      it 'keeps the case of uppercase letters' do
        expect(CaesarCipher.encode(string: 'WhAt a stRINg! 100%', shift: 5)).to eql('BmFy f xyWNSl! 100%')
      end

      it 'wraps from z to a' do
        expect(CaesarCipher.encode(string: 'Zebraz', shift: 1)).to eql('Afcsba')
      end

      it 'works with large positive shifts (> 26)' do
        expect(CaesarCipher.encode(string: 'What a string! 100%', shift: 75)).to eql('Texq x pqofkd! 100%')
      end
    end

    context 'has negative shift' do
      it 'works with small negative shifts' do
        expect(CaesarCipher.encode(string: 'What a string! 100%', shift: -5)).to eql('Rcvo v nomdib! 100%')
      end

      it 'works with large negative shifts' do
        expect(CaesarCipher.encode(string: 'What a string! 100%', shift: -125)).to eql('Bmfy f xywnsl! 100%')
      end
    end

    context 'has no shift' do
      it 'works with no shift (shift = 0)' do
        expect(CaesarCipher.encode(string: 'What a string! 100%', shift: 0)).to eql('What a string! 100%')
      end
    end
  end
end
