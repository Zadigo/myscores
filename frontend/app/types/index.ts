export type Nullable<T> = T | null

export type Undefineable<T> = T | undefined

export type Empty<T> = T | null | undefined

export type Player = {
  name: string
  score: number
  color: Nullable<string>
  increment: number
  resetValue: number
}

export type ScoreIncrement = {
  value: number
}
