export type Nullable<T> = T | null

export type Undefineable<T> = T | undefined

export type Empty<T> = T | null | undefined

export type ColorVariant = 'one' | 'two' | 'three' | 'four'

export type Player = {
  name: string
  score: number
  color: ColorVariant
  increment: number
  resetValue: number
}

export type ScoreIncrement = {
  value: number
}
